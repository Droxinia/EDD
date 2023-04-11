// ignore_for_file: prefer_const_constructors

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

import '../Components/Signupform.dart';
import '../Components/signinform.dart';

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
                            height: 640,
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
                                children: [
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
                                      "View 1000's of people's story and give out a helping hand. we are all one people of one nation use our paltform to get other stories out there join us on our journey today.",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Signin(),
                                  Divider(),
                                  Row(
                                    children: const [
                                      Expanded(child: Divider()),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Text(
                                          "OR",
                                          style:
                                              TextStyle(color: Colors.black26),
                                        ),
                                      ),
                                      Expanded(child: Divider()),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Text(
                                      "sign in with our website",
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.facebook,
                                          )),
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {},
                                          icon: Icon(Icons.facebook_outlined)),
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {},
                                          icon: Icon(Icons.facebook_rounded))
                                    ],
                                  )
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
            AnimatedButton(
                onPressed: () {
                  showGeneralDialog(
                      barrierDismissible: true,
                      barrierLabel: "Sign up",
                      context: context,
                      pageBuilder: (context, animation, secoundaryanimation) =>
                          Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              padding: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 24),
                              height: 625,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Column(
                                  children: const [
                                    Text(
                                      "Sign up",
                                      style: TextStyle(
                                          fontSize: 34,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      child: Text(
                                        "We are happy you have chosen to join us on your journey and hope our platform will be of help to you.",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Signupform()
                                  ],
                                ),
                              ),
                            ),
                          ));
                },
                child: const Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
