import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Voluntary extends StatelessWidget {
  const Voluntary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("voluntary".tr().toString()),
      ),
    );
  }
}
