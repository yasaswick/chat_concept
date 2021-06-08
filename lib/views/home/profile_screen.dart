import 'package:chat_concept/res/assets.dart';
import 'package:chat_concept/res/constants.dart';

import 'package:chat_concept/stores/global_store.dart';
import 'package:chat_concept/styles/app_colors.dart';
import 'package:chat_concept/swagger/api.dart';
import 'package:chat_concept/utils/time_ago.dart';
import 'package:chat_concept/widgets/AppButton.dart';
import 'package:chat_concept/widgets/AppImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../injection.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //Global store
  final GlobalStore _globalStore = getIt<GlobalStore>();

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
              Observer(builder: (_) {
                if (_globalStore.currentUser != null) {
                  return _buildUserDetailSection(_globalStore.currentUser!);
                } else {
                  return Container();
                }
              }),
              SizedBox(
                height: 20,
              ),
              AppButton(
                onTap: () {
                  _globalStore.removeUser();
                  Navigator.pop(context);
                },
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

  Widget _buildUserDetailSection(UserView user) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(user.profilePhoto ?? AppConstants.PROFILE_PLACEHOLDER)
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            user.name ?? '',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            user.bio ?? '',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            getTimeAgo(user.joinedDate ?? '0'),
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
                user.email ?? '',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
