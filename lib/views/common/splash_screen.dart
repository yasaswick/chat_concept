import 'package:chat_concept/res/preference.dart';
import 'package:chat_concept/stores/global_store.dart';
import 'package:chat_concept/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chat_concept/res/assets.dart';
import '../../injection.dart';
import '../main_wrapper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalStore _globalStore = getIt<GlobalStore>();

  @override
  void initState() {
    super.initState();
    getAccessToken();
  }

  Future getAccessToken() async {
    await _globalStore.setAccessToken();
    await navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary_color,
    );
  }

  Future navigate() async {
    //Image prechache
    await precacheImage(AssetImage(Assets.sign_in_image), context);
    await precacheImage(AssetImage(Assets.logo), context);
    await precacheImage(AssetImage(Assets.welcome_image), context);
    await precacheImage(AssetImage(Assets.welcome_text), context);

    //Checking if token is availible and get user from token
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
