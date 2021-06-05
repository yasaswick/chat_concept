import 'package:flutter/material.dart';

class AppTextInput extends StatelessWidget {
  final String? hintText;

  const AppTextInput({Key? key, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFC4C4C4)),
          borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        Expanded(
            child: TextField(
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 13, horizontal: 10),
              isCollapsed: true),
        ))
      ]),
    );
  }
}
