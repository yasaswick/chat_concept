import 'dart:convert';
import 'package:chat_concept/models/AppMessage.dart';
import 'package:chat_concept/res/assets.dart';
import 'package:chat_concept/stores/main_screen_store.dart';
import 'package:chat_concept/styles/app_colors.dart';
import 'package:chat_concept/swagger/api.dart';
import 'package:chat_concept/widgets/AppImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Stoer
  final MainScreenStore _store = MainScreenStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.grey[50],
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Column(
                children: [
                  _buildHeaderSection(),
                  if (_store.user.id != null)
                    Expanded(
                        child: StreamBuilder<List<AppMessage>>(
                            stream: _store.socket.stream.dataFeedStream,
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                return ListView.separated(
                                  reverse: true,
                                  separatorBuilder: (_, i) {
                                    return SizedBox(height: 10);
                                  },
                                  itemBuilder: (_, i) {
                                    var _chatData = snapshot.data![i];
                                    if (_chatData.origin ==
                                        _store.user.id.toString()) {
                                      return _buildChatBubble(_chatData, true);
                                    } else {
                                      return _buildChatBubble(_chatData, false);
                                    }
                                  },
                                  itemCount: snapshot.data!.length,
                                );
                              } else {
                                return Container();
                              }
                            })),
                  if (_store.user.id != null) _buildSendSection()
                ],
              ),
            ),
          )),
    );
  }

//Chat bubble
  Widget _buildChatBubble(AppMessage message, bool sent) {
    return Row(
      mainAxisAlignment: sent ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!sent)
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => _showUserProfile(),
              icon: AppThumbImage(
                message.photo ??
                    'httpHos://source.unsplash.com/okVXy9tG3KY/800x800',
                size: 30,
              )),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: AppColors.chat_reciever_gradient,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              message.content ?? '',
              style: TextStyle(color: Colors.white),
              textAlign: sent ? TextAlign.right : TextAlign.left,
            ),
          ),
        ),
        SizedBox(
          width: 30,
          height: 30,
        )
      ],
    );
  }

//Header section
  Widget _buildHeaderSection() {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: Text(
            'Welcome',
            style: Theme.of(context).textTheme.headline2,
          )),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProfileScreen())),
              icon: AppThumbImage(
                  'https://source.unsplash.com/okVXy9tG3KY/800x800'))
        ],
      ),
    );
  }

//Chat message typing section with send button
  Widget _buildSendSection() {
    return Row(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFFC4C4C4))),
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: _store.chatController,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                isCollapsed: true,
                border: InputBorder.none),
          ),
        )),
        SizedBox(
          width: 8,
        ),
        IconButton(
            onPressed: () async {
              _store.sendChatMessage();
            },
            icon: Image.asset(Assets.send_icon))
      ],
    );
  }

  void _showUserProfile() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return Wrap(
            children: [
              FutureBuilder(
                  future: Future.delayed(Duration(seconds: 2)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                        color: Colors.transparent,
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppImage(
                                        'https://source.unsplash.com/pJqfhKUpCh8/800x800')
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
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    'Aloha, my name is jane',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    'Joined 5m ago',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                              ],
                            )),
                      );
                    } else {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                        color: Colors.transparent,
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 40),
                                      child: CupertinoActivityIndicator(),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      );
                    }
                  }),
            ],
          );
        });
  }
}
