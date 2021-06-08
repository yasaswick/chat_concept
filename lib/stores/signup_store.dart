import 'package:chat_concept/api/authImpl.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../injection.dart';
import 'global_store.dart';
part 'signup_store.g.dart';

class SignUpScreenStore = _SignUpScreenStoreBase with _$SignUpScreenStore;

abstract class _SignUpScreenStoreBase with Store {
  //Auth implementation
  final AuthImpl _auth = AuthImpl();

  //Global store
  final GlobalStore _globalStore = getIt<GlobalStore>();

  //Text Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  //Selected image
  @observable
  Uri? selectedImage;

  //Loading indicator flag
  @observable
  bool isLoading = false;

  @action
  void setisLoading(bool value) => isLoading = value;

  @action
  void setImage(Uri? value) => selectedImage = value;

  @action
  Future registerUser() async {
    if (ageController.text.isNotEmpty && selectedImage != null) {
      isLoading = true;
      await _auth
          .register(nameController.text, emailController.text,
              passwordController.text, ageController.text, bioController.text)
          .then((value) async {
        await _auth.updloadProfilePic(selectedImage).then((value) {
          _globalStore.setCurrentUser(value);
        }).catchError((e) {});
      }).catchError((e) {});
      isLoading = false;
    }
  }

  //Dispose Method
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    ageController.dispose();
    bioController.dispose();
  }
}
