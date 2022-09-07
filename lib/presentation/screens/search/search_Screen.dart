
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/widgets/custom_indicator.dart';
import 'package:news/core/widgets/error_text.dart';
import 'package:news/presentation/cubit/data/data_cubit_state.dart';
import 'package:news/presentation/cubit/main/main_cubit.dart';

import '../../cubit/data/data_cubit.dart';
import '../../widgets/news/all_articles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataCubit = DataCubit.get(context);
    final mainCubit = MainCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            style: TextStyle(color:mainCubit.isDark? Colors.white:Colors.black),
            controller: dataCubit.searchController,
            onChanged: (value) => dataCubit.getSearch(query: value),
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search',
              suffixIcon: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  if (dataCubit.searchController.text.isEmpty) {
                    Navigator.pop(context);
                  } else {
                    dataCubit.searchController.clear();
                  }
                },
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          if (state is GetSearchLoaded) {
            return  AllArticles(article: dataCubit.search);
          } else if (state is GetSearchLoading) {
            return const CustomIndicator();
          } else if (state is GetSearchError) {
            return const ErrorText();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
