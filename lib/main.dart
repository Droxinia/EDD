import 'package:edd/Screens/Donations.dart';
import 'package:edd/Screens/Go_fund_me.dart';
import 'package:edd/Screens/Profile.dart';
import 'package:edd/Screens/Suplements.dart';
import 'package:flutter/material.dart';

import 'Screens/Onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const Onboarding_screen());
  }
}

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _currentindex = 0;
  final tabs = const [Donations(), Fundraiser(), Suplements(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Colors.blue,
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              backgroundColor: Colors.black,
              label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              backgroundColor: Colors.green,
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank),
              backgroundColor: Colors.green,
              label: 'Food')
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}
