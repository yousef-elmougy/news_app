import 'package:dio/dio.dart';
import 'package:news/core/constants/strings.dart';

class NewsService {
  Dio? dio;

  NewsService() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(baseOptions);
  }

  /// https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=924dea2a217c4b9f82a1a29ee2002ce7

  Future<Map<String, dynamic>> getCategory({String? category}) async {
    try {
      Response? response = await dio?.get('v2/top-headlines', queryParameters: {
        'country': 'us',
        'category': category,
        'apiKey': AppStrings.apiKey
      });
      // print(response?.data);
      return response?.data;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }

  /// https://newsapi.org/v2/everything?q=tesla&apiKey=924dea2a217c4b9f82a1a29ee2002ce7

  Future<Map<String, dynamic>> getSearch({String? query}) async {
    try {
      Response? response = await dio?.get('v2/everything',
          queryParameters: {'q': query, 'apiKey': AppStrings.apiKey});
      // print(response?.data);
      return response?.data;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }

/// https://newsapi.org/v2/top-headlines/sources?language=en&country=us&apiKey=c274b777d30e4f4c9eeefb8f6af3c7d2
  Future<Map<String, dynamic>> getSources() async {
    try {
      Response? response =
          await dio?.get('v2/top-headlines/sources', queryParameters: {
        "language": "en",
        "country": "us",
        'apiKey': AppStrings.apiKey,
      });
      // print(response?.data);
      return response?.data;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }
  /// https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=924dea2a217c4b9f82a1a29ee2002ce7
  Future<Map<String, dynamic>> getSourcesID({String? sourceID}) async {
    try {
      Response? response =
          await dio?.get('v2/top-headlines', queryParameters: {
        "sources": sourceID,
        'apiKey': AppStrings.apiKey,
      });
      // print(response?.data);
      return response?.data;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }
}
