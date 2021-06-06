import 'package:chat_concept/res/assets.dart';
import 'package:chat_concept/styles/app_colors.dart';
import 'package:chat_concept/widgets/AppButton.dart';
import 'package:chat_concept/widgets/AppImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(
              CupertinoIcons.chevron_left,
              color: Color(0xFFC4C4C4),
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppImage('https://source.unsplash.com/pJqfhKUpCh8/800x800')
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '10',
                      style: TextStyle(
                          color: AppColors.primary_color,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      Assets.chat_icon,
                      height: 20,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Jane Doe',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Aloha, my name is jane',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Joined 5m ago',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      'jane@jane.com',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AppButton(
                text: 'LOG OUT',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Incase you need any help or report someone drop us a message at blah@blah.com \n\nWe would love to hear from you about your experience and suggestions.',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
