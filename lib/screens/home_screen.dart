import 'package:flutter/material.dart';
import 'package:project_mini/screens/main_screen.dart';
import 'package:project_mini/screens/calendar_screen.dart';
import 'package:project_mini/screens/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF81758C),
        title: Text('MyHome'),
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
      body: Center(
        child: Column(
        ),
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
              leading: Icon(Icons.login_rounded),
              iconColor: const Color(0xFF937EA8),
              focusColor: const Color(0xFF937EA8),
              title: Text('Back to Login'),
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
    );
  }
}
