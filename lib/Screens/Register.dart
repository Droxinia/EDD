// ignore_for_file: prefer_const_constructors

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../signinform.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 430, 0, 0),
        child: Column(
          children: [
            AnimatedButton(
              onPressed: () {
                showGeneralDialog(
                    barrierDismissible: true,
                    barrierLabel: "sign in",
                    context: context,
                    pageBuilder: (context, animation, secoundaryanimation) =>
                        Center(
                          child: Container(
                            height: 620,
                            margin: EdgeInsets.symmetric(
                                horizontal: 29, vertical: 30),
                            padding: EdgeInsets.symmetric(
                                vertical: 32, horizontal: 24),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: Scaffold(
                              backgroundColor: Colors.transparent,
                              body: Column(
                                children: const [
                                  Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    child: Text(
                                      "View 1000's of people's story and give out a helping hand. we are all one people of one nation use our paltform to get other stories out there join us on our journey today",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Signin()
                                ],
                              ),
                            ),
                          ),
                        ));
              },
              child: const Text("Sign in"),
            ),
            const SizedBox(
              height: 25,
            ),
            AnimatedButton(onPressed: () {}, child: const Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
