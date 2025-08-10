import 'package:flutter/material.dart';
import 'package:project_mini/chatting/component/chat_bubble.dart';

class Messages extends StatelessWidget {
  final List<Map<String, dynamic>> messages;
  final String currentUserId;

  const Messages({Key? key, required this.messages, required this.currentUserId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final chat = messages[index];
        return ChatBubbles(
          chat['text'] ?? '',
          chat['userID'] == currentUserId,
          chat['userName'] ?? '',
          chat['userImage'] ?? 'image/eggtart.jpg',
        );
      },
    );
  }
}
