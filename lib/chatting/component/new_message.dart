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
    FocusScope.of(context).unfocus();

    widget.onSendMessage(_userEnterMessage.trim());

    _controller.clear();
    setState(() {
      _userEnterMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: null,
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Send a message...'),
              onChanged: (value) {
                setState(() {
                  _userEnterMessage = value;
                });
              },
            ),
          ),
          IconButton(
            onPressed:
            _userEnterMessage.trim().isEmpty ? null : _sendMessage,
            icon: const Icon(Icons.send),
            color: Color(0xFF937EA8),
          ),
        ],
      ),
    );
  }
}
