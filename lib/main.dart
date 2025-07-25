import 'package:flutter/material.dart';
import 'package:project_mini/screens/home_screen.dart';
import 'package:project_mini/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
      ),
      home: LoginSignupScreen(),
    );
  }
}
