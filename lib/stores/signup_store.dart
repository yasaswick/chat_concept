import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'signup_store.g.dart';

class SignUpScreenStore = _SignUpScreenStoreBase with _$SignUpScreenStore;

abstract class _SignUpScreenStoreBase with Store {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    ageController.dispose();
    bioController.dispose();
  }
}
