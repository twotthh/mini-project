import 'package:flutter/material.dart';

class ChatBubbles extends StatelessWidget {
  const ChatBubbles(
      this.message,
      this.isMe,
      this.userName,
      this.userImage,
      this.time, {
        Key? key,
        required this.showProfile,
      }) : super(key: key);

  final String message;
  final bool isMe;
  final String userName;
  final String userImage;
  final String time;
  final bool showProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: showProfile ? 10 : 2,
        bottom: 2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) ...[
            if (showProfile)
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(userImage),
              )
            else
              const SizedBox(width: 36),

            const SizedBox(width: 6),

            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showProfile)
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 2),
                      child: Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF808080),
                        ),
                      ),
                    ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Color(0XFFFAFAFA),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            message,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ] else ...[
            // 내 메시지
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Color(0xFF81758C),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        message,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0XFFFAFAFA),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
