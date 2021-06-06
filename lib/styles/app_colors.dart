import 'package:flutter/material.dart';

//App Colors
class AppColors {
  AppColors._();

  //Primary Color
  static const Color primary_color = Color(0xFF48837F);

  //Text colors light
  static const Color primary_text_color_light = Color(0xFF1B1C20);
  static const Color secondart_text_color_light = Color(0xFF1B1C20);

  //Text colors dark
  static const Color primary_text_color_dark = Colors.white;
  static const Color secondart_text_color_dark = Colors.white;

  //Gradients
  static const LinearGradient chat_reciever_gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.2, 1],
    colors: [Color(0xFF3f4c6b), Color(0xFF606c88)],
  );
}
