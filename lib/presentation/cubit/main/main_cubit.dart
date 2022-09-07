import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/strings.dart';
import '../../../core/helper/cache_helper.dart';
import '../../../data/model/onboarding_model.dart';
import '../../screens/Sources/sources_screen.dart';
import '../../screens/main_tab_screen.dart';
import 'main_cubit_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  /// BOTTOM NAVIGATION BAR

  int currentIndex = 0;

  List<Widget> screens = [
    const MainTabScreen(),
    const SourcesScreen(),
  ];

  bottomNavPress(int index) {
    currentIndex = index;
    emit(BottomNavBarState());
  }

  /// ON BOARDING

  int selectedPageIndex = 0;
  var pageController = PageController();

  onPageChanged(int index) {
    selectedPageIndex = index;
    emit(OnBoardingSuccessState());
  }

  List<OnBoardingInfo> onboardingPages = [
    OnBoardingInfo(
      imageAsset: AppStrings.orderImage,
      title: AppStrings.orderTitle,
      description: AppStrings.orderDesc,
    ),
    OnBoardingInfo(
      imageAsset: AppStrings.cookImage,
      title: AppStrings.cookTitle,
      description: AppStrings.cookDesc,
    ),
    OnBoardingInfo(
      imageAsset: AppStrings.deliverImage,
      title: AppStrings.deliverTitle,
      description: AppStrings.deliverDesc,
    )
  ];

  /// THEME MODE
  bool isDark = false;

  void changeTheme({bool? isDARK}) {
    if (isDARK != null) {
      isDark = isDARK;
    } else {
      isDark = !isDark;

      CacheHelper.setData(key: AppStrings.isDarkKey, value: isDark);
      emit(ThemeSuccessState());
    }
  }
}
