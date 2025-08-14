import 'package:flutter/material.dart';
import 'package:heycoun/screens/home_screen.dart';
import 'package:heycoun/chatting/component/message.dart';
import 'package:heycoun/chatting/component/new_message.dart';
import 'package:heycoun/config/palette.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final String currentUserId = 'user1';
  final String currentUserName = '서현';
  final String currentUserImage = 'images/eggtart.jpg';

  final List<Map<String, dynamic>> _messages = [
    {
      'text': '안녕~',
      'userID': 'user1',
      'userName': '서현',
      'userImage': 'images/eggtart.jpg'
    },
  ];

  void _handleSendMessage(String message) {
    setState(() {
      _messages.insert(0, {
        'text': message,
        'userID': currentUserId,
        'userName': currentUserName,
        'userImage': currentUserImage,
      });
    });
  }

  void _signOut() {
    // 실제 로그아웃 기능 없음
    print('User signed out');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Palette.mainColor2,
        title: const Text(
          'Chatting..',
          style: TextStyle(fontWeight: FontWeight.w600, color: Color(0XFFFAFAFA)),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0XFFFAFAFA)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app_rounded, color: Palette.mainColor2),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Messages(
              messages: _messages,
              currentUserId: currentUserId,
            ),
          ),
          NewMessage(onSendMessage: _handleSendMessage),
        ],
      ),
    );
  }
}
