import 'package:edd/Components/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../main.dart';
import 'base.dart';

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
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordcontroller,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(labelText: 'password'),
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
                child: Text('Dont have an  accaunt'))
          ],
        ),
      ),
    );
  }
}
