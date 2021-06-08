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
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.logo,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        Assets.welcome_image,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    Assets.welcome_text,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
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
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MainWrapper()));
    });
  }
}
