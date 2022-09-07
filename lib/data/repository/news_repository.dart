import 'package:news/data/model/news_model.dart';
import 'package:news/data/model/sources_model.dart';
import 'package:news/data/services/news_service.dart';

class NewsRepository {
  final NewsService newsService;

  NewsRepository({required this.newsService});

  Future<List<Articles>?> getCategory({String? category}) async {
    final articles = await newsService.getCategory(category: category);
    return ArticleResponse.fromJson(articles).articles;
  }

  Future<List<Articles>?> getSearch({String? query}) async {
    final search = await newsService.getSearch(query: query);
    return ArticleResponse.fromJson(search).articles;
  }

  Future<List<Sources>?> getSources() async {
    final sources = await newsService.getSources();
    return SourcesResponse.fromJson(sources).sources;
  }

  Future<Source?> getSourcesID({String? sourceID}) async {
    final sourcesID =await newsService.getSourcesID(sourceID: sourceID);
    return Articles.fromJson(sourcesID).source;
  }
}
