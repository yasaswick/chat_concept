import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //Common Colors
  static const Color primary_color_light = Color(0xff0082d6);
  static const Color primary_color_dark = Color(0xff494949);

  static const Color font_color_light = Colors.white;
  static const Color font_color_dark = Colors.black;

  //Bottom Nav
  static const Color bottom_nav_backgrount = Color(0xFF112127);

  //Gradients
  static const LinearGradient background_gradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0, 0.8, 1],
    colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
  );

  //Text Colors
  static const Color text_bright_white = Color(0xFFFFFFFF);
  static const Color text_white = Color(0xFFEFEFEF);
  static const Color text_grey = Color(0xFFACACAC);
}
