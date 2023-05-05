import 'package:edd/Screens/Register/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
      body: Center(
        child: Column(
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
            const SizedBox(
              height: 4,
            ),
            TextField(
              obscureText: true,
              controller: passwordcontroller,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.done,
              decoration:
                  InputDecoration(labelText: 'password'.tr().toString()),
            ),
            const SizedBox(
              height: 4,
            ),
            TextField(
              obscureText: true,
              controller: emailcontroller,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  labelText: 'confirm password'.tr().toString()),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailcontroller.text.trim(),
                        password: passwordcontroller.text.trim());
                  } on FirebaseAuthException catch (e) {
                    print(e);
                  }
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text(
                  'signup',
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
                          builder: (BuildContext context) => Login()));
                },
                child: Text('already have an account'.tr().toString()))
          ],
        ),
      ),
    );
  }
}
