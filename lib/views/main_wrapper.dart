import 'package:chat_concept/stores/global_store.dart';
import 'package:chat_concept/views/auth/login_screen.dart';
import 'package:chat_concept/views/auth/sign_up_screen.dart';
import 'package:chat_concept/views/auth/welcome_screen.dart';
import 'package:chat_concept/views/home/main_screen.dart';
import 'package:chat_concept/views/home/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../injection.dart';

///This observes the logged in user
class MainWrapper extends StatelessWidget {
  final GlobalStore _globalStore = getIt<GlobalStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (_globalStore.currentUser == null) {
        switch (_globalStore.pageIndex) {
          case 1:
            return LoginScreen();
          case 2:
            return SignUpScreen();

          default:
            return WelcomeScreen();
        }
      } else {
        return MainScreen();
      }
    });
  }
}
