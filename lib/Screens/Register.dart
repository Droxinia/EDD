// ignore_for_file: prefer_const_constructors

import 'package:animated_button/animated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:edd/Components/base.dart';
import 'package:edd/Components/signin.dart';
import 'package:edd/Components/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Signup()));
              },
              child: Text("sign in".tr().toString()),
            ),
            const SizedBox(
              height: 25,
            ),
            AnimatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              StreamBuilder<User?>(
                                  stream:
                                      FirebaseAuth.instance.authStateChanges(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Base();
                                    } else {
                                      return Signup();
                                    }
                                  })));
                },
                child: Text("sign Up".tr().toString()))
          ],
        ),
      ),
    );
  }
}
