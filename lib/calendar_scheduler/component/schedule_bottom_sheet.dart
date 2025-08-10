import 'package:flutter/material.dart';
import 'package:project_mini/calendar_scheduler/component/custom_text_field.dart';
import 'package:project_mini/config/palette.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({Key? key}) : super(key: key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery
        .of(context)
        .viewInsets
        .bottom;

    return SafeArea(
      child: Container(
        height: MediaQuery
            .of(context)
            .size
            .height / 2 + bottomInset,
        color: const Color(0xFFFAFAFA),
        child: Padding(
          padding: EdgeInsets.only(
              left: 8,
              right: 8,
              top: 8,
              bottom: bottomInset
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: '시작 시간',
                      isTime: true,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: CustomTextField(
                      label: '종료 시간',
                      isTime: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Expanded(
                child: CustomTextField(
                  label: '내용',
                  isTime: false,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 30,
                child: ElevatedButton(
                  onPressed: onSavePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF937EA8),
                  ),
                  child: Text(
                      '저장',
                      style: TextStyle(color: Color(0xFFFAFAFA),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void onSavePressed() {
    print('저장하기 버튼을 눌렀습니다.');
  }
}
