// ignore_for_file: unnecessary_import, implementation_imports

import 'package:edd/Screens/Register/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../main.dart';
import '../../Components/base.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: emailcontroller,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'email'.tr().toString()),
            ),
            TextField(
              controller: passwordcontroller,
              textInputAction: TextInputAction.done,
              decoration:
                  InputDecoration(labelText: 'password'.tr().toString()),
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                onPressed: () async {
                  // showDialog(
                  //     context: context,
                  //     builder: (context) => Center(
                  //           child: CircularProgressIndicator(),
                  //         ));
                  try {
                    final cred = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailcontroller.text.trim(),
                            password: passwordcontroller.text.trim());

                    if (cred.user?.email != null) {
                      navigatorKey.currentState!.pushAndRemoveUntil(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) => const Base()),
                        ModalRoute.withName('/'),
                      );
                    }
                  } on FirebaseAuthException catch (e) {
                    print(e);
                  }
                },
                icon: const Icon(Icons.lock_open),
                label: const Text(
                  'signin',
                  style: TextStyle(fontSize: 24),
                )),
            const SizedBox(
              height: 24,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Signup()));
                },
                child: Text('dont have an  accaunt'.tr().toString()))
          ],
        ),
      ),
    );
  }
}
