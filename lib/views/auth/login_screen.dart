import 'package:chat_concept/res/assets.dart';
import 'package:chat_concept/widgets/AppButton.dart';
import 'package:chat_concept/widgets/AppTextInput.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [Expanded(child: Image.asset(Assets.sign_in_image))],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              AppTextInput(
                hintText: 'Enter your email',
              ),
              AppTextInput(
                hintText: 'Enter your password',
              ),
              AppButton(
                text: 'SIGN IN',
              ),
              _buildFooterSection()
            ],
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
              onPressed: () {},
              child: Text(
                'Register',
                style: Theme.of(context).textTheme.headline3,
              ))
        ],
      ),
    );
  }
}
