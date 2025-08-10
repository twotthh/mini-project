import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:project_mini/config/palette.dart';

class MainCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDate;

  MainCalendar({
    required this.onDaySelected,
    required this.selectedDate,
});

  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR',
      onDaySelected: onDaySelected,
      selectedDayPredicate: (date) =>
        date.year == selectedDate.year &&
            date.month == selectedDate.month &&
            date.day == selectedDate.day,

      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2050, 12, 31),
      focusedDay: DateTime.now(),

      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
        )
      ),

      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: const Color(0xFFFAFAFA),
        ),
        weekendDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: const Color(0xFFC4BDCC),
        ),
        selectedDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: Palette.iconColor,
            width: 1.0,
          ),
        ),
        defaultTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1A1A1A)
        ),
        weekendTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A)
        ),
        selectedTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A)
        ),
      ),
    );
  }
}
