import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/constants/strings.dart';
import 'package:news/core/widgets/custom_indicator.dart';
import 'package:news/core/widgets/error_text.dart';
import 'package:news/data/model/sources_model.dart';
import '../../cubit/data/data_cubit.dart';
import '../../cubit/data/data_cubit_state.dart';
import '../../widgets/news/all_articles.dart';

class SourcesDetailsScreen extends StatelessWidget {
  const SourcesDetailsScreen({Key? key, required this.sources})
      : super(key: key);

  final Sources sources;

  @override
  Widget build(BuildContext context) {
    final dataCubit = DataCubit.get(context);
    dataCubit.getSourcesID(sourceID: sources.id);

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DataCubit, DataState>(
        builder: (BuildContext context, state) {
          if (state is GetSourcesIDLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          '${AppStrings.pathLogo}/${sources.id}.png'),
                      radius: 40,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      sources.name.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      sources.description.toString(),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    FutureBuilder(
                        future:
                            dataCubit.getCategory(category: sources.category),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            return Expanded(
                              child: AllArticles(
                                article: snapshot.data,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return const ErrorText();
                          } else if (!(snapshot.hasData)) {
                            return const CustomIndicator();
                          }
                          return const SizedBox();
                        }),
                  ],
                ),
              ),
            );
          } else if (state is GetSourcesIDLoading) {
            return const CustomIndicator();
          } else if (state is GetSourcesIDError) {
            return const ErrorText();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
