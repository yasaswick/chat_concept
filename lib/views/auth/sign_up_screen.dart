import 'package:chat_concept/res/assets.dart';
import 'package:chat_concept/widgets/AppButton.dart';
import 'package:chat_concept/widgets/AppTextInput.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Image.asset(
                      Assets.upload_image,
                      height: 150,
                    ))
                  ],
                ),
                AppTextInput(
                  hintText: 'Enter your email',
                ),
                AppTextInput(
                  hintText: 'Enter your password',
                ),
                AppTextInput(
                  hintText: 'How old are you ?',
                ),
                AppTextInput(
                  hintText: 'Whats interesting about you ? Any Hobbies ?',
                  isMultiLine: true,
                ),
                AppButton(
                  text: 'SIGN UP',
                ),
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
          Expanded(
            child: Text('Already have an account ?',
                style: Theme.of(context).textTheme.headline4),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Log In',
                style: Theme.of(context).textTheme.headline3,
              ))
        ],
      ),
    );
  }
}
