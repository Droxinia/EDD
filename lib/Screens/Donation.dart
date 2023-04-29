// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:edd/Components/model.dart';
import 'package:edd/Screens/Register/Register.dart';
import 'package:edd/Screens/Register/signin.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/donation_bloc.dart';

class Donation extends StatelessWidget {
  const Donation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DonationBloc, DonationState>(
        builder: (context, state) {
          if (state is DonationLoaded) {
            List<DonationModel> data = state.mydata;
            return SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      'Donations',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (_, index) {
                      return Container();
                    },
                  )
                ],
              ),
            );
          } else if (state is DonationLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
