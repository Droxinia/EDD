// ignore_for_file: prefer_const_constructors

import 'package:animated_button/animated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:edd/Components/base.dart';
import 'package:edd/Screens/Register/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showGeneralDialog(
            barrierDismissible: true,
            barrierLabel: 'languages'.tr().toString(),
            context: context,
            pageBuilder: ((context, animation, secondaryAnimation) => Center(
                  child: Container(
                    height: 320,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(40)),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Center(
                        child: Column(
                          children: [
                            Text(
                              'languages'.tr().toString(),
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'change-language'.tr().toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  context.locale = const Locale('en', 'US'),
                              child: Container(
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/images/1.jpg'),
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Text('English'),
                                  ],
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  context.locale = const Locale('am', 'ETH'),
                              child: Container(
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/images/2.jpg'),
                                        radius:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Text('amharic'.tr().toString()),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          );
        },
        child: Icon(Icons.language),
      ),
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: Center(
              child: Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_pzuipcff.json',
                height: 200,
                width: 200,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'One country',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'one people',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Together',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Signup()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.blue,
                  ),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                StreamBuilder<User?>(
                                    stream: FirebaseAuth.instance
                                        .authStateChanges(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Base();
                                      } else {
                                        return Signup();
                                      }
                                    })));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.blue,
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
