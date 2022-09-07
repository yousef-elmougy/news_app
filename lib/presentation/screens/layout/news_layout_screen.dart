import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/main/main_cubit.dart';
import '../../cubit/main/main_cubit_state.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCubit = MainCubit.get(context);

    return BlocBuilder<MainCubit, MainState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: mainCubit.currentIndex,
            onTap: (index) {
              mainCubit.bottomNavPress(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: 'category',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.settings,
              //   ),
              //   label: 'settings',
              // ),
            ],
          ),
          body: IndexedStack(
            index: mainCubit.currentIndex,
            children: mainCubit.screens,
          ),
        );
      },
    );
  }
}
