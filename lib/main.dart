import 'package:chat_concept/styles/app_themes.dart';
import 'package:chat_concept/views/auth/login_screen.dart';
import 'package:chat_concept/views/auth/sign_up_screen.dart';
import 'package:chat_concept/views/auth/welcome_screen.dart';
import 'package:chat_concept/views/home/main_screen.dart';
import 'package:chat_concept/views/home/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'injection.dart';
import 'views/common/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  configureDependencies();
  runApp(MainApp());
}

//Locking orietation to portrait
Future init() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.themeData(false, context),
      home: SplashScreen(),
    );
  }
}
