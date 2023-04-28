import 'dart:async';
import 'package:edd/Screens/Register/Register.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 6), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Register()));
    });
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(130.0),
            child: Lottie.network(
                "https://assets10.lottiefiles.com/packages/lf20_pzuipcff.json",
                height: 100,
                width: 100,
                repeat: true,
                fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 190, 20, 50),
            child: Text(
              "Charity-EDD".tr().toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
              
            ),
          ),
        ],
      ),

     
    );
  }
}
