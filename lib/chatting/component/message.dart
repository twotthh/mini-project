import 'package:flutter/material.dart';
import 'package:heycoun/chatting/component/chat_bubble.dart';

class Messages extends StatelessWidget {
  final List<Map<String, dynamic>> messages;
  final String currentUserId;

  const Messages({
    Key? key,
    required this.messages,
    required this.currentUserId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return const Center(child: Text('메시지가 없습니다.'));
    }

    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final chat = messages[index] ?? {};
        final prevChat = index < messages.length - 1 ? messages[index + 1] : null;

        final text = (chat['text'] ?? '').toString();
        final userId = (chat['userID'] ?? '').toString();
        final userName = (chat['userName'] ?? '알 수 없음').toString();
        final userImage = (chat['userImage'] ?? 'image/eggtart.jpg').toString();
        final time = chat['time'] ?? DateTime.now();

        // 직전 메시지와 같은 사람이면 프로필/이름 생략
        final isSameUserAsPrevious =
            prevChat != null && prevChat['userID'] == chat['userID'];

        return ChatBubbles(
          message: text,
          isMe: userId == currentUserId,
          userName: userName,
          userImage: userImage,
          time: time,
          showProfile: !isSameUserAsPrevious,
        );
      },
    );
  }
}
