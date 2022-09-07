import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/constants/strings.dart';
import '../../../data/model/news_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({
    Key? key,
    this.articles,
  }) : super(key: key);
  final Articles? articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: articles?.urlToImage != null
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: AppStrings.placeholderImage,
                      image: '${articles?.urlToImage}',
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      AppStrings.placeholderImage,
                      fit: BoxFit.cover,
                    ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            expandedHeight: 400,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        articles!.title.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        articles!.content.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebView(
                            initialUrl: articles?.url.toString(),
                          ),
                        ));
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Link  :  ',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextSpan(
                          text: articles!.url.toString(),
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
