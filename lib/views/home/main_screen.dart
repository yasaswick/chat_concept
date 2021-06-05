import 'package:chat_concept/stores/global_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../injection.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _globalStore = getIt<GlobalStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
