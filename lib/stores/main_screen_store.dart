import 'dart:convert';

import 'package:chat_concept/injection.dart';
import 'package:chat_concept/models/AppMessage.dart';
import 'package:chat_concept/res/constants.dart';
import 'package:chat_concept/stores/global_store.dart';
import 'package:chat_concept/swagger/api.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:chat_concept/sockets/chat_socket.dart';

part 'main_screen_store.g.dart';

class MainScreenStore = _MainScreenStoreBase with _$MainScreenStore;

abstract class _MainScreenStoreBase with Store {
  _MainScreenStoreBase() {
    _initializeSocket();
  }

  //Global store
  final GlobalStore _globalStore = getIt<GlobalStore>();

  //Socket
  late ChatSocket socket;

  //User
  late UserView user;

  //Text Controllers
  final TextEditingController chatController = TextEditingController();

  void _initializeSocket() {
    user = _globalStore.currentUser ?? UserView();
    if (user.id != null) {
      socket = ChatSocket(user.id.toString());
    }
  }

  @observable
  bool isLoading = false;
  @action
  void setisLoading(bool value) => isLoading = value;

  //Send chat message and clear chat input
  void sendChatMessage() {
    if (chatController.text.isNotEmpty) {
      var message = chatController.text;
      chatController.text = '';
      socket.channel.sink.add(json.encode(AppMessage(
              (user.id ?? 0).toString(),
              'all',
              user.profilePhoto ?? AppConstants.PROFILE_PLACEHOLDER,
              message)
          .toJson()));
    }
  }
}
