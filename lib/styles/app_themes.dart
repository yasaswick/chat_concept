import 'dart:ui';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            color: isDarkTheme ? Colors.white : Colors.black),
        bodyText2: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            color: isDarkTheme ? Colors.white : Colors.black),
        headline1: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w600,
            color: isDarkTheme ? Colors.white : Colors.black),
        headline2: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: isDarkTheme ? Colors.white : Colors.black),
        headline3: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: isDarkTheme ? Colors.white : Colors.black),
        headline4: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDarkTheme ? Colors.white : Colors.black),
      ),
      backgroundColor: isDarkTheme ? Color(0xff9584ff) : Colors.grey[800],
      canvasColor: Colors.grey[50],
    );
  }
}
