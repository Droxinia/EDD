import 'package:edd/Components/base.dart';
import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  const Signin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Username",
          style: TextStyle(color: Colors.black54),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Username is empty";
              }
              return null;
            },
            decoration: const InputDecoration(
                prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.person),
            )),
          ),
        ),
        const Text(
          "Password",
          style: TextStyle(color: Colors.black54),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Password is empty";
              }
              return null;
            },
            obscureText: true,
            decoration: const InputDecoration(
                prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.key),
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 24),
          child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Base()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  minimumSize: const Size(double.infinity, 56),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25)))),
              icon: const Icon(Icons.arrow_right),
              label: const Text("Sign in")),
        )
      ],
    ));
  }
}
