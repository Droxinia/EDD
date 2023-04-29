import 'package:edd/Screens/Register/Register.dart';
import 'package:edd/Screens/Register/signin.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Donation extends StatelessWidget {
  const Donation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'Donations',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Register()));
                },
                child: Text('signout'.tr().toString())),
          ),
        ],
      ),
    );
  }
}
