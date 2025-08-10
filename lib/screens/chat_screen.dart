import 'package:flutter/material.dart';
import 'package:project_mini/chatting/chat/message.dart';
import 'package:project_mini/chatting/chat/new_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final String currentUserId = 'user1'; // 가짜 로그인 유저 ID
  final String currentUserName = '서현';
  final String currentUserImage = 'image/eggtart.jpg';

  final List<Map<String, dynamic>> _messages = [
    {
      'text': '안녕~',
      'userID': 'user1',
      'userName': '서현',
      'userImage': 'image/eggtart.jpg'
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
    // 로컬이라 실제 로그아웃 기능 없음. 필요시 구현 가능
    print('User signed out');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFF81758C),
        title: const Text('MyChat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app_rounded, color: Color(0xFF81758C)),
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
