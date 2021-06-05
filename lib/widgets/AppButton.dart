import 'package:chat_concept/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;

  const AppButton({Key? key, this.text, this.onTap}) : super(key: key);

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
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
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
