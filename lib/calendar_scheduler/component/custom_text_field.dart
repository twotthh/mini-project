import 'package:project_mini/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime;

  const CustomTextField({
    required this.label,
    required this.isTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFF937EA8),
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          flex: isTime ? 0 : 1,
          child: TextFormField(
            cursorColor: const Color(0xFF937EA8),
            maxLines: isTime ? 1 : null,
            expands: !isTime,
            keyboardType: isTime ? TextInputType.number : TextInputType.multiline,

            inputFormatters: isTime?
            [
              FilteringTextInputFormatter.digitsOnly,
            ] :
            [],
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: const Color(0xFFD4D6D5),
              suffixText: isTime ? '시' : null,
            ),
          ),
        ),
      ],
    );
  }
}
