import '../views/common/splash_screen.dart';
import 'package:flutter/material.dart';

import '../views/auth/login_screen.dart';

class Routes {
  Routes._();
  static const String splash = '/splash';
  static const String login = '/login';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
  };
}
