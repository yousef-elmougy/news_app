import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/repository/news_repository.dart';
import 'package:news/data/services/news_service.dart';
import 'package:news/presentation/cubit/data/data_cubit.dart';
import 'package:news/presentation/cubit/main/main_cubit.dart';
import 'package:news/presentation/cubit/main/main_cubit_state.dart';
import 'package:news/presentation/screens/Sources/sources_details.dart';
import 'core/constants/bloc_observer.dart';
import 'core/constants/strings.dart';
import 'core/helper/cache_helper.dart';
import 'core/routes/route.dart';
import 'core/themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool isDark;
  isDark = CacheHelper.getData(key: AppStrings.isDarkKey) ?? false;
  BlocOverrides.runZoned(
    () => runApp(
      MyApp(
        isDark: isDark,
      ),
    ),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.isDark,
  }) : super(key: key);
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => DataCubit(
                newsRepository: NewsRepository(newsService: NewsService()))
              // ..getSources()
              // ..getSourcesID()
        ),
        BlocProvider(
          create: (context) => MainCubit()..changeTheme(isDARK: isDark),
        ),
      ],
      child: BlocBuilder<MainCubit, MainState>(
        builder: (BuildContext context, state) {
          return MaterialApp(
            theme:
                MainCubit.get(context).isDark ? AppTheme.dark : AppTheme.light,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoute.onGenerateRoute,
          );
        },
      ),
    );
  }
}
