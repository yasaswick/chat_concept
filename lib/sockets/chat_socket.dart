import 'dart:async';
import 'dart:io';
import 'package:chat_concept/bloc/chat_data_controller.dart';
import 'package:chat_concept/models/AppMessage.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatSocket {
  //immutable chat data controller
  final stream = ChatDataController<AppMessage>();
  late WebSocketChannel channel;

  //Stream Subcriptions
  late StreamSubscription _subscription;

  ChatSocket(String userId) {
    channel = WebSocketChannel.connect(
      // Uri.parse('wss://chirp-yasas.herokuapp.com/ws/$userId'),
      Uri.parse('ws://localhost:8000/ws/$userId'),
    );
    init();
  }

  //init method to open socket
  Future init() async {
    _subscription = channel.stream.listen((event) {
      print(event);
      stream.appendData(appMessageFromJson(event));
    });
  }

  //dispose method
  void dispose() {
    channel.sink.close();
    _subscription.cancel();
  }

  //on disconnect callback
  void onDisconnected() {}

  //on connect callback
  void onConnected() {}
}
