import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';

class AppTheme {
  static final light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.deepOrange,

    /// FLOATING ACTION BUTTON THEME
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange,
    ),

    /// APP BAR THEME
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    //
    /// BOTTOM NAVIGATION BAR THEME
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
      ),
      selectedItemColor: Colors.deepOrange,
      type: BottomNavigationBarType.fixed,
    ),

    /// TAB BAR THEME

    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
    ),

    /// TEXT THEME
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        // fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        // fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),

    /// TEXT FORM FIELD THEME
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        // fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      labelStyle: TextStyle(
        // fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      suffixIconColor: Colors.black,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.deepOrange,
    ),
    // TextSelectionThemeData.cursorColor
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Colors.black,
      selectionHandleColor: Colors.black,
    ),
  );

/// ############################################################################################################################## ///

  static final dark = ThemeData(
    scaffoldBackgroundColor: AppColors.dark,
    primaryColor: Colors.deepOrange,

    /// FLOATING ACTION BUTTON THEME
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange,
    ),

    /// APP BAR THEME

    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.dark,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    /// BOTTOM NAVIGATION BAR THEME

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.dark,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
      ),
      selectedItemColor: Colors.deepOrange,
      type: BottomNavigationBarType.fixed,
      unselectedLabelStyle: TextStyle(color: Colors.white),
      selectedLabelStyle: TextStyle(color: Colors.white),
    ),

    /// TAB BAR THEME
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
    ),

    /// TEXT THEME

    textTheme: const TextTheme(
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        // fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        // fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),

    /// TEXT FORM FIELD THEME

    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      labelStyle: TextStyle(
        // fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      suffixIconColor: Colors.white,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.deepOrange,
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Colors.white,
      selectionHandleColor: Colors.white,
    ),
  );
}
