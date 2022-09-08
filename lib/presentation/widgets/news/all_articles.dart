import 'package:flutter/material.dart';

import '../../../data/model/news_model.dart';
import 'custom_article_widget.dart';

class AllArticles extends StatelessWidget {
  const AllArticles({super.key, required this.article});

  final List<Articles> article;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) => CustomArticleItem(article: article[i]),
      itemCount: article.length,
    );
  }
}
