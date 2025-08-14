import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';
import 'package:intl/intl.dart';

class ChatBubbles extends StatelessWidget {
  const ChatBubbles({
    Key? key,
    required this.message,
    required this.isMe,
    required this.userName,
    required this.userImage,
    required this.time,
    this.showProfile = true, // 나의 메시지에도 프로필을 표시할지 결정하는 용도로는 사용하지 않을 수 있습니다.
    // 또는 isMe일 때는 항상 프로필을 보여주도록 할 수도 있습니다.
  }) : super(key: key);

  final String message;
  final bool isMe;
  final String userName;
  final String userImage;
  final DateTime time;
  final bool showProfile; // 이 플래그를 어떻게 사용할지 다시 고려해볼 수 있습니다.

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('HH:mm a').format(time); // 예: "10:30 AM"

    if (isMe) {
      // 나의 메시지 (오른쪽) - 프로필 이미지와 이름, 시간을 함께 표시하도록 수정
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // 전체를 오른쪽으로 정렬
          children: [
            // 프로필 이미지와 이름 (오른쪽 정렬)
            // Row를 사용하여 오른쪽 정렬된 요소들 내에서 다시 오른쪽으로 배치
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Row 내부 요소들을 오른쪽으로 정렬
              children: [
                Text(
                  userName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundImage: userImage.startsWith('http')
                      ? NetworkImage(userImage)
                      : AssetImage(userImage) as ImageProvider,
                  radius: 16,
                ),
              ],
            ),
            const SizedBox(height: 4), // 프로필과 말풍선 사이 간격

            // 말풍선 (오른쪽)
            ChatBubble(
              clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
              alignment: Alignment.topRight, // 말풍선 자체도 오른쪽 정렬
              backGroundColor: const Color(0xFF7F7391), // 원하는 나의 메시지 색상
              margin: EdgeInsets.zero,
              child: Text(
                message,
                style: const TextStyle(color: Colors.white), // 나의 메시지 텍스트 색상
              ),
            ),
            const SizedBox(height: 2),

            // 시간 (오른쪽)
            Text(
              formattedTime,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      );
    } else {
      // 상대 메시지 (왼쪽) - 기존 로직 유지
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상대방 프로필 (showProfile 플래그에 따라 표시 여부 결정)
            if (showProfile) ...[
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: userImage.startsWith('http')
                        ? NetworkImage(userImage)
                        : AssetImage(userImage) as ImageProvider,
                    radius: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    userName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 4),
            ],
            ChatBubble(
              clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
              backGroundColor: const Color(0xFFE0E0E0), // 상대방 메시지 색상 (예시)
              margin: EdgeInsets.zero,
              child: Text(
                message,
                style: const TextStyle(color: Colors.black87), // 상대방 메시지 텍스트 색상 (예시)
              ),
            ),
            const SizedBox(height: 2),
            Text(
              formattedTime,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      );
    }
  }
}
