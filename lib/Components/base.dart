import 'package:edd/Screens/Donation.dart';
import 'package:edd/Screens/Profile.dart';
import 'package:edd/Screens/Settings.dart';
import 'package:edd/Screens/Voluntary.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../Screens/Request form/Form.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _currentindex = 0;
  final tabs = [
    const Donation(),
    const Voluntary(),
    const Formfillin(),
    ProfilePage(),
    const Settings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentindex],
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Colors.lightBlue,
        currentIndex: _currentindex,
        items: [
          FloatingNavbarItem(
              icon: Icons.attach_money, title: 'donate'.tr().toString()),
          FloatingNavbarItem(
              icon: Icons.volunteer_activism,
              title: 'volunteer'.tr().toString()),
          FloatingNavbarItem(icon: Icons.folder, title: 'form'.tr().toString()),
          FloatingNavbarItem(
              icon: Icons.person, title: 'profile'.tr().toString()),
          FloatingNavbarItem(
              icon: Icons.settings, title: 'settings'.tr().toString()),
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
