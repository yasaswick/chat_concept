import 'dart:io';

import 'package:chat_concept/res/assets.dart';
import 'package:chat_concept/stores/global_store.dart';
import 'package:chat_concept/stores/signup_store.dart';
import 'package:chat_concept/utils/device_utils.dart';
import 'package:chat_concept/widgets/AppButton.dart';
import 'package:chat_concept/widgets/AppTextInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../injection.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

enum Options { camera, gallery }

class _SignUpScreenState extends State<SignUpScreen> {
  //Global Store
  final GlobalStore _globalStore = getIt<GlobalStore>();

  //Stores
  final SignUpScreenStore _store = SignUpScreenStore();

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        var image = await DeviceUtils.pickFromGallery();
                        _store.setImage(image);
                      },
                      child: Observer(builder: (_) {
                        if (_store.selectedImage != null) {
                          return Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: FileImage(
                                        File(_store.selectedImage!.path)))),
                          );
                        } else {
                          return Image.asset(
                            Assets.upload_image,
                            height: 150,
                          );
                        }
                      }),
                    ),
                  ],
                ),
                AppTextInput(
                  _store.nameController,
                  hintText: 'Enter your name',
                  keyboard: TextInputType.name,
                ),
                AppTextInput(
                  _store.emailController,
                  hintText: 'Enter your email',
                  keyboard: TextInputType.emailAddress,
                ),
                AppTextInput(
                  _store.passwordController,
                  hintText: 'Enter your password',
                  isPassword: true,
                  keyboard: TextInputType.text,
                ),
                AppTextInput(
                  _store.ageController,
                  hintText: 'How old are you ?',
                  keyboard: TextInputType.number,
                ),
                AppTextInput(
                  _store.bioController,
                  hintText: 'Whats interesting about you ? Any Hobbies ?',
                  isMultiLine: true,
                ),
                Observer(builder: (_) {
                  return AppButton(
                    isLoading: _store.isLoading,
                    onTap: () async {
                      await _store.registerUser();
                    },
                    text: 'SIGN UP',
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
          Expanded(
            child: Text('Already have an account ?',
                style: Theme.of(context).textTheme.headline4),
          ),
          TextButton(
              onPressed: () {
                _globalStore.setPageIndex(1);
              },
              child: Text(
                'Log In',
                style: Theme.of(context).textTheme.headline3,
              ))
        ],
      ),
    );
  }
}
