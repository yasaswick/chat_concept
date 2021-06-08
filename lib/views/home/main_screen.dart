import 'dart:ui';
import 'package:chat_concept/api/authImpl.dart';
import 'package:chat_concept/models/AppMessage.dart';
import 'package:chat_concept/res/assets.dart';
import 'package:chat_concept/res/constants.dart';
import 'package:chat_concept/stores/main_screen_store.dart';
import 'package:chat_concept/styles/app_colors.dart';
import 'package:chat_concept/swagger/api.dart';
import 'package:chat_concept/utils/time_ago.dart';
import 'package:chat_concept/views/home/search_delegate.dart';
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
  //Store
  final MainScreenStore _store = MainScreenStore();
  //Auth implementation
  final AuthImpl _auth = AuthImpl();

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
          body: Stack(
            children: [
              SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: Column(
                    children: [
                      if (_store.user.id != null)
                        Expanded(
                            child: Container(
                          child: StreamBuilder<List<AppMessage>>(
                              initialData: [],
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
                                        return buildChatBubble(_chatData, true);
                                      } else {
                                        return buildChatBubble(
                                            _chatData, false);
                                      }
                                    },
                                    itemCount: snapshot.data!.length,
                                  );
                                } else {
                                  return Container();
                                }
                              }),
                        )),
                      if (_store.user.id != null) _buildSendSection()
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 0, left: 0, right: 0, child: _buildHeaderSection()),
            ],
          )),
    );
  }

//Chat bubble
  Widget buildChatBubble(AppMessage message, bool sent) {
    return Row(
      mainAxisAlignment: sent ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!sent)
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                if (message.origin != null) {
                  _showUserProfile(message.origin!);
                }
              },
              icon: AppThumbImage(
                message.photo ?? '',
                size: 30,
              )),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: sent
                    ? AppColors.chat_sender_gradient
                    : AppColors.chat_reciever_gradient,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              message.content ?? '',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

//Header section
  Widget _buildHeaderSection() {
    return Container(
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Container(
            decoration:
                BoxDecoration(color: Colors.grey.shade200.withOpacity(0.5)),
            padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: MediaQuery.of(context).padding.top,
                bottom: 10),
            child: Row(
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ProfileScreen())),
                    icon: AppThumbImage(_store.user.profilePhoto ??
                        AppConstants.PROFILE_PLACEHOLDER)),
                Expanded(
                    child: Text(
                  'Chirp',
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                )),
                IconButton(
                    icon: Icon(
                      CupertinoIcons.search,
                      size: 25,
                    ),
                    onPressed: () {
                      showSearch(
                          context: context, delegate: MessageSearch(_store));
                      //  Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (_) => SearchScreen(_store)));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

//Chat message typing section with send button
  Widget _buildSendSection() {
    return Row(
      children: [
        SizedBox(
          width: 8,
        ),
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

  void _showUserProfile(String id) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return Wrap(
            children: [
              FutureBuilder<UserView?>(
                  future: _auth.getProfileById(id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
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
                                    AppImage(snapshot.data!.profilePhoto ?? '')
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    snapshot.data!.name ?? '',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    snapshot.data!.bio ?? '',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    'Joined ' +
                                        getTimeAgo(
                                            snapshot.data!.joinedDate ?? '0'),
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
