import 'package:chat_concept/res/preference.dart';
import 'package:chat_concept/stores/global_store.dart';
import 'package:chat_concept/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../injection.dart';
import '../main_wrapper.dart';

class SplashScreen extends StatelessWidget {
  final GlobalStore _globalStore = getIt<GlobalStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary_color,
    );
  }

  Future navigate(BuildContext context) async {
    var preferences = await SharedPreferences.getInstance();

    if (preferences.getString(AppPreferences.access_token) != null) {
      var _token = preferences.getString(AppPreferences.access_token);
      if (_token != null) {
        if (_token.isNotEmpty) {
          await _globalStore.getUserFromToken();
        }
      }
    }
    Future.delayed(Duration(milliseconds: 1000), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MainWrapper()));
    });
  }
}
