import 'package:flutter/material.dart';

import '../../../data/model/news_model.dart';
import 'custom_article_widget.dart';

class AllArticles extends StatelessWidget {
  const AllArticles({
    Key? key, required this.article,
  }) : super(key: key);

  final List<Articles> article;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) => CustomArticleItem(
        article: article[i],
      ),
      itemCount: article.length,
    );
  }
}
