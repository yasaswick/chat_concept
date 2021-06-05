import 'package:chat_concept/styles/app_themes.dart';
import 'package:chat_concept/views/home/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'injection.dart';

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
      theme: AppThemes.themeData(false, context),
      home: MainScreen(),
    );
  }
}
