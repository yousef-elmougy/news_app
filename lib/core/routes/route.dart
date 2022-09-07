import 'package:flutter/material.dart';
import 'package:news/data/model/news_model.dart';
import 'package:news/presentation/screens/Sources/sources_details.dart';
import '../../data/model/sources_model.dart';
import '../../presentation/screens/detail/news_details.dart';
import '../../presentation/screens/layout/news_layout_screen.dart';
import '../../presentation/screens/search/search_Screen.dart';
import '../constants/strings.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.newsLayoutScreen:
        return MaterialPageRoute(builder: (_) => const NewsLayout());

      case AppStrings.newsDetailsScreen:
        final article = settings.arguments as Articles;
        return MaterialPageRoute(
            builder: (_) => NewsDetailsScreen(articles: article));

      case AppStrings.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      case AppStrings.sourcesDetailsScreen:
        final sources = settings.arguments as Sources;
        return MaterialPageRoute(
            builder: (_) => SourcesDetailsScreen(sources: sources,));

      default:
        return defaultRoute();
    }
  }

  static MaterialPageRoute<dynamic> defaultRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'ERROR : Route Not Found',
          ),
        ),
        body: const Center(
          child: Text(
            'ERROR : Route Not Found',
          ),
        ),
      ),
    );
  }
}
