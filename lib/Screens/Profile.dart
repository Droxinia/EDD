import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("profile".tr().toString()),
      ),
    );
  }
}
