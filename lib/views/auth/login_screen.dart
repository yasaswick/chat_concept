import 'package:chat_concept/res/assets.dart';
import 'package:chat_concept/stores/global_store.dart';
import 'package:chat_concept/stores/signin_store.dart';

import 'package:chat_concept/widgets/AppButton.dart';
import 'package:chat_concept/widgets/AppTextInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../injection.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final SignInScreenStore _store = SignInScreenStore();
  final GlobalStore _globalStore = getIt<GlobalStore>();

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Image.asset(Assets.sign_in_image))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45.0),
                  child: Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                AppTextInput(
                  _store.emailController,
                  hintText: 'Enter your email',
                  keyboard: TextInputType.emailAddress,
                ),
                AppTextInput(
                  _store.passwordController,
                  isPassword: true,
                  hintText: 'Enter your password',
                ),
                Observer(builder: (_) {
                  return AppButton(
                    isLoading: _store.isLoading,
                    text: 'SIGN IN',
                    onTap: () {
                      _store.loginUser();
                    },
                  );
                }),
                _buildFooterSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooterSection() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('New Here ?', style: Theme.of(context).textTheme.headline4),
          TextButton(
              onPressed: () {
                _globalStore.setPageIndex(2);
              },
              child: Text(
                'SIGN UP',
                style: Theme.of(context).textTheme.headline3,
              ))
        ],
      ),
    );
  }
}
