import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/strings.dart';
import '../../../data/model/news_model.dart';

class CustomArticleItem extends StatelessWidget {
  const CustomArticleItem({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppStrings.newsDetailsScreen,arguments: article);
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: SizedBox(
                height: 120,
                width: 120,
                child: article.urlToImage != null
                    ? FadeInImage.assetNetwork(
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: AppStrings.placeholderImage,
                        image: '${article.urlToImage}',
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        AppStrings.placeholderImage,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      article.title.toString(),

                      style: Theme.of(context).textTheme.headline6,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    // const Spacer(),
                    Expanded(
                      child: Text(
                        article.description.toString(),

                        style: const TextStyle(color: Colors.grey, fontSize: 15),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Published At : ${DateFormat.yMMMd().format(
                          DateTime.parse(article.publishedAt.toString()))}',

                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
