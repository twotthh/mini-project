import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  final Function(String message) onSendMessage;

  const NewMessage({Key? key, required this.onSendMessage}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _userEnterMessage = '';

  void _sendMessage() {
    if (_userEnterMessage.trim().isEmpty) return;
    FocusScope.of(context).unfocus();
    widget.onSendMessage(_userEnterMessage.trim());
    _controller.clear();
    setState(() {
      _userEnterMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 입력창
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: const Color(0xFFF5F5F5),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, color: Color(0xFF81758C)),
                  onPressed: () {},
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Color(0XFFFAFAFA),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: const Color(0xFFDDDDDD)),
                    ),
                    child: TextField(
                      controller: _controller,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: 'Send a Message...',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _userEnterMessage = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _userEnterMessage.trim().isEmpty ? null : _sendMessage,
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFF81758C),
                    child: const Icon(Icons.arrow_upward, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          // 하단 버튼들
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            color: const Color(0xFFF5F5F5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBottomButton(Icons.chat_bubble, "New Chat"),
                _buildBottomButton(Icons.calendar_month, "Schedule"),
                _buildBottomButton(Icons.attach_file, "Attachment"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(IconData icon, String text) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0XFFFAFAFA),
        foregroundColor: const Color(0xFF81758C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFFF5F5F5)),
        ),
      ),
      onPressed: () {},
      icon: Icon(icon, size: 18),
      label: Text(text, style: const TextStyle(fontSize: 13)),
    );
  }
}
