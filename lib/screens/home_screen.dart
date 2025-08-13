import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:heycoun/config/palette.dart';
import 'package:heycoun/screens/chat_screen.dart';
import 'package:heycoun/screens/main_screen.dart';
import 'package:heycoun/screens/calendar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0XFFFAFAFA),
        elevation: 0,
        title: Text(
          'HeyCoun',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Palette.mainColor2,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Color(0XFF1A1A1A)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChatScreen();
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0XFF1A1A1A)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle_rounded, color: Color(0XFF1A1A1A)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'My Records',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                separatorBuilder: (_, __) => SizedBox(width: 12),
                itemBuilder: (_, index) => Container(
                  width: 180,
                  decoration: BoxDecoration(
                    color: Color(0xFF81758C),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            Text(
              'Checklist',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Checkbox(value: false, onChanged: (v) {}),
                  SizedBox(width: 4),
                  Text('Buy some fruits..', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 15),

            // 나의 상담 돌아보기
            Text(
              'Counseling Calendar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Color(0xFF81758C),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF81758C),
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 14),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ChatScreen();
                },
              ),
            );
          },
          child: Text(
            'Shall we go?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0XFFFAFAFA)),
          ),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('images/eggtart.jpg'),
              ),
              accountName: const Text('서현',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              accountEmail: const Text('abc12345@naver.com',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              onDetailsPressed: () {},
              decoration: const BoxDecoration(
                color: Color(0xFF81758C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              iconColor: const Color(0xFF937EA8),
              focusColor: const Color(0xFF937EA8),
              title: const Text('Back to Login',
                  style: TextStyle(
                      color: Color(0XFF1A1A1A),
                      fontWeight: FontWeight.w600)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginSignupScreen();
                    },
                  ),
                );
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              iconColor: const Color(0xFF937EA8),
              focusColor: const Color(0xFF937EA8),
              title: const Text('Start Counseling',
                  style: TextStyle(
                      color: Color(0XFF1A1A1A),
                      fontWeight: FontWeight.w600)),
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
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: const Icon(Icons.checklist_rtl_rounded),
              iconColor: const Color(0xFF937EA8),
              focusColor: const Color(0xFF937EA8),
              title: const Text('Calendar Scheduler',
                  style: TextStyle(
                      color: Color(0XFF1A1A1A),
                      fontWeight: FontWeight.w600)),
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
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              iconColor: const Color(0xFF937EA8),
              focusColor: const Color(0xFF937EA8),
              title: const Text('Settings',
                  style: TextStyle(
                      color: Color(0XFF1A1A1A),
                      fontWeight: FontWeight.w600)),
              onTap: () {},
              trailing: const Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
    );
  }
}
