import 'dart:async';
import 'dart:io';
import 'package:chat_concept/bloc/chat_data_controller.dart';

class ChatSocket {
  //immutable chat data controller
  final dataFeedController = ChatDataController();

  ChatSocket() {
    init();
  }

  //init method to open socket
  Future init() async {}

  //dispose method
  void dispose() {}

  //on disconnect callback
  void onDisconnected() {}

  //on connect callback
  void onConnected() {}
}
