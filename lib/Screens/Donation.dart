import 'package:edd/Components/signin.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class Donation extends StatelessWidget {
  const Donation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
            },
            child: Text('signout'.tr().toString())),
      ),
    );
  }
}
