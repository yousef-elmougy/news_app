
import '../../../data/model/news_model.dart';
import '../../../data/model/sources_model.dart';

abstract class DataState{}

class DataInitialState extends DataState{}

class GetSearchLoaded extends DataState{
  final List<Articles>? articles;

  GetSearchLoaded(this.articles);
}
class GetSearchLoading extends DataState{}
class GetSearchError extends DataState{
  final String error;

  GetSearchError(this.error);
}

class GetSourcesLoaded extends DataState{
  final List<Sources>? sources;

  GetSourcesLoaded(this.sources);
}
class GetSourcesLoading extends DataState{}
class GetSourcesError extends DataState{
  final String error;

  GetSourcesError(this.error);
}

class GetSourcesIDLoaded extends DataState{
  final Source? source;

  GetSourcesIDLoaded(this.source);
}
class GetSourcesIDLoading extends DataState{}
class GetSourcesIDError extends DataState{
  final String error;

  GetSourcesIDError(this.error);
}

