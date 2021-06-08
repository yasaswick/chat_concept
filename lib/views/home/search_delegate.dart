import 'package:chat_concept/stores/main_screen_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Message search which extends search delegate
class MessageSearch extends SearchDelegate<String> {
  final MainScreenStore store;

  MessageSearch(this.store)
      : super(
          searchFieldLabel: 'Search messeges',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          searchFieldDecorationTheme: InputDecorationTheme(
            isCollapsed: true,
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.grey[50],
        brightness: Brightness.light,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white54),
          border: InputBorder.none,
        ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(CupertinoIcons.chevron_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var _data = store.socket.stream.data
        .where((element) => element.content!.contains(query))
        .toList();

    return ListView.builder(
        itemCount: _data.length,
        itemBuilder: (_, i) {
          return ListTile(
            title: Text(
              _data[i].content ?? '',
              style: TextStyle(fontSize: 14),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var _data = store.socket.stream.data
        .where((element) => element.content!.contains(query))
        .toList();

    return ListView.builder(
        itemCount: _data.length,
        itemBuilder: (_, i) {
          return ListTile(
            title: Text(
              _data[i].content ?? '',
              style: TextStyle(fontSize: 14),
            ),
          );
        });
  }
}
