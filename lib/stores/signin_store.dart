import 'package:chat_concept/api/authImpl.dart';
import 'package:chat_concept/stores/global_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../injection.dart';
part 'signin_store.g.dart';

class SignInScreenStore = _SignInScreenStoreBase with _$SignInScreenStore;

abstract class _SignInScreenStoreBase with Store {
  //Auth implementation
  final AuthImpl _auth = AuthImpl();

  //Global store
  final GlobalStore _globalStore = getIt<GlobalStore>();

//Text Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @observable
  bool isLoading = false;
  @action
  void setisLoading(bool value) => isLoading = value;

  @action
  Future loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isLoading = true;
      await _auth
          .login(emailController.text, passwordController.text)
          .then((value) {
        print(value);

        _globalStore.setCurrentUser(value);
      }).catchError((e) {});
      isLoading = false;
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
