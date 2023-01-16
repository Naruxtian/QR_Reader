import 'package:flutter/material.dart';

class AppTheme{

  static const Color primaryColor = Colors.deepOrange;
  static const Color secondaryColor = Colors.orangeAccent;

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: primaryColor,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: secondaryColor,
      unselectedItemColor: Colors.grey,
      elevation: 0,
    ),
  );
}