import 'package:flutter/material.dart';

import 'base.dart';

class Signupform extends StatelessWidget {
  const Signupform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("User Name",
            style: TextStyle(
              color: Colors.black54,
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, top: 8),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(prefixIcon: Icon(Icons.person)),
          ),
        ),
        const Text("Phone no",
            style: TextStyle(
              color: Colors.black54,
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, top: 8),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(prefixIcon: Icon(Icons.phone)),
          ),
        ),
        const Text("Password",
            style: TextStyle(
              color: Colors.black54,
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, top: 8),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(prefixIcon: Icon(Icons.key)),
          ),
        ),
        const Text("Confirm password",
            style: TextStyle(
              color: Colors.black54,
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, top: 8),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "";
              }
              return null;
            },
            decoration:
                const InputDecoration(prefixIcon: Icon(Icons.key_rounded)),
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
              label: const Text("Sign up")),
        ),
      ],
    ));
  }
}
