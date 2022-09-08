import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presentation/cubit/data/data_cubit.dart';
import 'package:news/presentation/cubit/data/data_cubit_state.dart';
import 'package:news/presentation/cubit/main/main_cubit.dart';
import 'package:news/presentation/cubit/main/main_cubit_state.dart';
import '../../core/constants/strings.dart';
import '../../core/widgets/custom_indicator.dart';
import '../../core/widgets/error_text.dart';

import '../widgets/news/all_articles.dart';

class MainTabScreen extends StatelessWidget {
  const MainTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataCubit = DataCubit.get(context);
    final mainCubit = MainCubit.get(context);

    return DefaultTabController(
      length: dataCubit.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News App',
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, AppStrings.searchScreen);
              },
            ),
            BlocBuilder<MainCubit, MainState>(
                builder: (BuildContext context, state) {
              return IconButton(
                icon:
                    Icon(mainCubit.isDark ? Icons.light_mode : Icons.dark_mode),
                onPressed: () {
                  mainCubit.changeTheme();
                },
              );
            }),
          ],
          bottom: TabBar(
            tabs: dataCubit.tabs,
            isScrollable: true,
            indicatorColor: Colors.deepOrange,
          ),
        ),
        // body: TabBarView(children: dataCubit.widgets,),
        body: BlocBuilder<DataCubit, DataState>(
          builder: (BuildContext context, state) {
            return TabBarView(
              children: List.generate(dataCubit.tabs.length, (index) {
                return FutureBuilder(
                    future: dataCubit.getCategory(
                        category: dataCubit.catData[index]),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return AllArticles(article: snapshot.data);
                      } else if (snapshot.hasError) {
                        return const ErrorText();
                      } else if (!(snapshot.hasData)) {
                        return const CustomIndicator();
                      }
                      return const SizedBox();
                    });
              }),
            );
          },
        ),
      ),
    );
  }
}
