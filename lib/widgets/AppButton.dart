import 'package:chat_concept/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final bool isLoading;
  final String? text;
  final VoidCallback? onTap;

  const AppButton({Key? key, this.text, this.onTap, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: InkWell(
            onTap: onTap,
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primary_color,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: isLoading
                      ? const EdgeInsets.symmetric(vertical: 15.0)
                      : const EdgeInsets.symmetric(vertical: 16.0),
                  child: isLoading
                      ? Theme(data: ThemeData(cupertinoOverrideTheme: CupertinoThemeData(brightness: Brightness.dark)), 
      child: CupertinoActivityIndicator())
                      : Text(
                          text ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                )),
          ))
        ],
      ),
    );
  }
}
