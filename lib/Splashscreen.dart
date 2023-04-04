import 'dart:async';

import 'package:edd/Screens/signin.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Signin()));
    });
    return const Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Text("EDD app"),
      ),
    );
  }
}
