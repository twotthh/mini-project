import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';

class ChatBubbles extends StatelessWidget {
  const ChatBubbles(this.message, this.isMe, this.userName, this.userImage,
      {Key? key})
      : super(key: key);

  final String message;
  final String userName;
  final bool isMe;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    ImageProvider avatarImage;

    if (userImage.startsWith('http')) {
      avatarImage = NetworkImage(userImage);
    } else {
      avatarImage = AssetImage(userImage);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe) CircleAvatar(radius: 16, backgroundImage: avatarImage),
          const SizedBox(width: 6),
          ChatBubble(
            clipper: ChatBubbleClipper8(
              type: isMe ? BubbleType.sendBubble : BubbleType.receiverBubble,
            ),
            backGroundColor: isMe
                ? const Color(0xFF81758C)
                : Color(0XFFFAFAFA),
            margin: const EdgeInsets.all(0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: isMe ? Color(0XFFFAFAFA) : Color(0XFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 14,
                      color: isMe ? Color(0XFFFAFAFA) : Color(0XFF1A1A1A),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isMe) const SizedBox(width: 6),
          if (isMe) CircleAvatar(radius: 16, backgroundImage: avatarImage),
        ],
      ),
    );
  }
}
