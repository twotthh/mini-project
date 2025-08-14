import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    if (messages.isEmpty) return const SizedBox.shrink();

    return ListView.builder(
      reverse: true, // 최신 메시지가 아래쪽으로 가도록
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final Map<String, dynamic> chat = messages[index] ?? {};

        final String text      = (chat['text'] ?? '').toString();
        final String userId    = (chat['userID'] ?? '').toString();
        final String userName  = (chat['userName'] ?? '알 수 없음').toString();
        final String userImage = (chat['userImage'] ?? 'images/eggtart.jpg').toString();

        // 시간 문자열 만들기 (DateTime/String 모두 허용)
        String timeStr;
        final dynamic t = chat['time'];
        if (t is DateTime) {
          timeStr = DateFormat('a hh:mm', 'ko').format(t);
        } else if (t is String && t.trim().isNotEmpty) {
          timeStr = t;
        } else {
          timeStr = DateFormat('a hh:mm', 'ko').format(DateTime.now());
        }

        final Map<String, dynamic>? prevVisible =
        (index > 0) ? messages[index - 1] : null;

        final bool showProfile =
            prevVisible == null ||
                (prevVisible['userID']?.toString() != userId);

        final bool isMe = (userId == currentUserId);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0), // 위아래 여백 4픽셀
          child: ChatBubbles(
            text,            // message
            isMe,            // isMe
            userName,        // userName
            userImage,       // userImage
            timeStr,         // time
            showProfile: !isMe && showProfile,
          ),
        );
      },
    );
  }
}
