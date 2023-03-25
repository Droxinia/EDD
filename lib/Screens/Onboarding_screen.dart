import 'dart:async';

import 'package:edd/main.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Onboarding_screen extends StatelessWidget {
  const Onboarding_screen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Base()));
    });
    return Scaffold(
      body: Column(
        children: const [],
      ),
    );
  }
}
