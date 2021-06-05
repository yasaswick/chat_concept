import 'dart:ui';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        textTheme: TextTheme(
            bodyText1: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: isDarkTheme ? Colors.white : Colors.black),
            bodyText2: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: isDarkTheme ? Colors.white : Colors.black),
            headline1: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            headline4: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            headline3: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
        primaryColor: isDarkTheme ? Colors.black : Colors.white,
        backgroundColor: isDarkTheme ? Color(0xff9584ff) : Colors.grey[800],
        cardColor: isDarkTheme
            ? AppColors.primary_color_dark
            : AppColors.primary_color_light,
        canvasColor: Colors.grey[50],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: isDarkTheme
                ? AppColors.primary_color_dark
                : AppColors.primary_color_light),
        accentColor: isDarkTheme ? Colors.white : Colors.white);
  }
}
