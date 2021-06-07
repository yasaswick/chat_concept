import 'package:flutter/material.dart';

class AppTextInput extends StatelessWidget {
  final String? hintText;
  final bool isMultiLine;
  final TextEditingController controller;
  const AppTextInput(this.controller,
      {Key? key, this.hintText, this.isMultiLine = false})
      : super(key: key);

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
          controller: controller,
          maxLines: isMultiLine ? 3 : 1,
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
