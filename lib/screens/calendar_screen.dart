import 'package:flutter/material.dart';
import 'package:project_mini/calendar_scheduler/component/main_calendar.dart';
import 'package:project_mini/calendar_scheduler/component/schedule_card.dart';
import 'package:project_mini/calendar_scheduler/component/today_banner.dart';
import 'package:project_mini/calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:project_mini/screens/home_screen.dart';
import 'package:project_mini/screens/chat_screen.dart';

class HomeCalendarScreen extends StatefulWidget {
  const HomeCalendarScreen({Key? key}) : super(key: key);

  @override
  State<HomeCalendarScreen> createState() => _HomeCalendarScreenState();
}

class _HomeCalendarScreenState extends State<HomeCalendarScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text('MyCalendar'),
        backgroundColor: Color(0xFF81758C),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
              color: const Color(0xFF1A1A1A)
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
              color: const Color(0xFF1A1A1A)
          )
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('image/eggtart.jpg'),
              ),
              accountName: Text('서현'),
              accountEmail: Text('abc12345@naver.com'),
              onDetailsPressed: () {},
              decoration: BoxDecoration(
                color: const Color(0xFF81758C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              iconColor: const Color(0xFF937EA8),
              focusColor: const Color(0xFF937EA8),
              title: Text('Back to Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
              },
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: Icon(Icons.chat),
              iconColor: const Color(0xFF937EA8),
              focusColor: const Color(0xFF937EA8),
              title: Text('Start Counseling'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChatScreen();
                    },
                  ),
                );
              },
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: Icon(Icons.calendar_month_rounded),
              iconColor: const Color(0xFF937EA8),
              focusColor: const Color(0xFF937EA8),
              title: Text('Calendar Sceduler'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeCalendarScreen();
                    },
                  ),
                );
              },
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              iconColor: const Color(0xFF937EA8),
              focusColor: const Color(0xFF937EA8),
              title: Text('Settings'),
              onTap: () {},
              trailing: Icon(Icons.navigate_next),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
      backgroundColor: const Color(0xFF937EA8),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isDismissible: true,
          builder: (_) => ScheduleBottomSheet(),
          isScrollControlled: true,
        );
      },
        child: Icon(
          Icons.add,
            color: const Color(0xFFFAFAFA)
          ),
        ),
      body: SafeArea(
          child: Column(
            children: [
              MainCalendar(
                selectedDate: selectedDate,
                onDaySelected: onDaySelected,
              ),

              SizedBox(height: 8),
              TodayBanner(
                  selectedDate: selectedDate,
                  count: 0,
              ),
              SizedBox(height: 8),

              ScheduleCard(
                  startTime: 12,
                  endTime: 15,
                  content: 'sample'
              ),
            ],
          ),
        ),
      );
    }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
