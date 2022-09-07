import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/strings.dart';
import '../../cubit/main/main_cubit.dart';
import '../../cubit/main/main_cubit_state.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCubit = MainCubit.get(context);
    return BlocBuilder<MainCubit, MainState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [

                PageView.builder(
                    controller: mainCubit.pageController,
                    onPageChanged: (index) => mainCubit.onPageChanged(index),
                    itemCount: mainCubit.onboardingPages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                              mainCubit.onboardingPages[index].imageAsset),
                          const SizedBox(height: 32),
                          Text(
                            mainCubit.onboardingPages[index].title,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 32),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 64.0),
                            child: Text(
                              mainCubit.onboardingPages[index].description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      );
                    }),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Row(
                    children: List.generate(
                      mainCubit.onboardingPages.length,
                      (index) {
                        return  Container(
                          margin: const EdgeInsets.all(4),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: mainCubit.selectedPageIndex == index
                                ? Colors.red
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: FloatingActionButton(
                    elevation: 0,
                    onPressed: () {
                      if (mainCubit.selectedPageIndex ==
                          mainCubit.onboardingPages.length - 1) {
                       Navigator.pushNamed(context, AppStrings.newsLayoutScreen);
                      } else {
                        mainCubit.pageController.nextPage(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.ease);
                      }
                    },
                    child: Text(mainCubit.selectedPageIndex ==
                        mainCubit.onboardingPages.length - 1
                        ? 'Start'
                        : 'Next'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
