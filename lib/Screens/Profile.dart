// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            Center(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 207, 202, 202),
                    radius: 70,
                    child: Icon(
                      Icons.person,
                      size: 70,
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.camera))
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Email:',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 68, 127, 238)),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              user.email!,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
