import 'package:flutter/material.dart';

import 'Donatin_request.dart';
import 'Help_request.dart';

class Formfillin extends StatefulWidget {
  const Formfillin({super.key});

  @override
  State<Formfillin> createState() => _FormfillinState();
}

class _FormfillinState extends State<Formfillin> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          title: const Text('Form'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(text: 'Donation request', icon: Icon(Icons.attach_money)),
            Tab(
              text: 'Volunteer request',
              icon: Icon(Icons.volunteer_activism),
            )
          ]),
        ),
        body: const TabBarView(children: [Donationrequest(), Helprequest()]),
      ),
    );
  }
}
