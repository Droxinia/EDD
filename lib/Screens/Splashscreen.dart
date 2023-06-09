import 'dart:async';
import 'package:edd/Screens/Register/Register.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 10), () {
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
            padding: EdgeInsets.fromLTRB(25, 190, 20, 50),
            child: Text(
              "     ethiopian Digital Donations".tr().toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),

      //backgroundColor: const Color.fromARGB(255, 5, 157, 228),
      //     body: Row(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
      //       child: Lottie.network(
      //         "https://assets10.lottiefiles.com/packages/lf20_pzuipcff.json",
      //         height: 100,
      //         width: 100,
      //         repeat: true,
      //       ),
      //     ),
      //     const Padding(
      //       padding: EdgeInsets.fromLTRB(0, 500, 70, 50),
      //       child: Text(
      //         "EDD",
      //         style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     // Padding(
      //     //   padding: const EdgeInsets.fromLTRB(20, 550, 40, 50),
      //     //   child: const Text(
      //     //     "Ethiopian Digital Donation",
      //     //     style: TextStyle(
      //     //       fontSize: 20,
      //     //       fontWeight: FontWeight.normal,
      //     //     ),
      //     //   ),
      //     // ),
      //   ],
      // )
    );
  }
}
