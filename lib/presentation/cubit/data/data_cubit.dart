import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/repository/news_repository.dart';
import '../../../data/model/news_model.dart';
import '../../../data/model/sources_model.dart';
import 'data_cubit_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit({required this.newsRepository}) : super(DataInitialState());

  final NewsRepository newsRepository;

  static DataCubit get(context) => BlocProvider.of(context);

  /// GET DATA

  List<String> catData = [
    'general',
    'business',
    'sports',
    'science',
    'health',
    'entertainment',
    'technology',
  ];
  final List<Widget> tabs = const [
    Text('General'),
    Text('Business'),
    Text('Sports'),
    Text('Science'),
    Text('Health'),
    Text('Entertainment'),
    Text('Technology'),
  ];
  TextEditingController searchController = TextEditingController();

  Future<List<Articles>?> getCategory({String? category}) async {
    return await newsRepository.getCategory(category: category);
  }

  List<Articles> search = [];

  Future<List<Articles>?> getSearch({String? query}) async {
    emit(GetSearchLoading());
    return await newsRepository.getSearch(query: query).then((value) {
      emit(GetSearchLoaded(value));
      if (value != null) {
        search = value;
        search = search.where((element) {
          return element.title!
                  .toLowerCase()
                  .startsWith(query!.toLowerCase()) &&
              element.title!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    }).catchError((e) {
      emit(GetSearchError(e.toString()));
    });
  }

  List<Sources>? sources = [];

  Future<List<Sources>?> getSources() async {
    emit(GetSourcesLoading());
    return await newsRepository.getSources().then((value) {
      emit(GetSourcesLoaded(value));
      sources = value;
    }).catchError((e) {
      emit(GetSourcesError(e.toString()));
    });
  }

  Future<Source?> getSourcesID({String? sourceID}) async {
    emit( GetSourcesIDLoading());
    return await newsRepository.getSourcesID(sourceID: sourceID).then((value) {
      emit(GetSourcesIDLoaded(value));
    }).catchError((e){
      emit(GetSourcesIDError(e.toString()));
    });
  }
}
