// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, prefer_final_fields

import 'dart:ffi';

import 'package:edd/Screens/Request%20form/imagepicker.dart';
import 'package:flutter/material.dart';

class Formfillin extends StatefulWidget {
  const Formfillin({super.key});

  @override
  State<Formfillin> createState() => _FormfillinState();
}

class _FormfillinState extends State<Formfillin> {
  var _value = "-1";
  final Title = TextEditingController();
  final Description = TextEditingController();
  final Phone = TextEditingController();
  final Address = TextEditingController();
  final Bank = TextEditingController();
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: () {
          final isLastStep = currentStep == getSteps().length - 1;
          if (isLastStep) {
            Float();
          } else {
            setState(() {
              currentStep += 1;
            });
          }
        },
        onStepCancel: currentStep == 0
            ? null
            : () => setState(() {
                  currentStep -= 1;
                }),
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          final isLastStep = currentStep == getSteps().length - 1;
          return Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ElevatedButton(
                        onPressed: details.onStepContinue,
                        child: Text(isLastStep ? 'confirm' : 'Next'))),
                SizedBox(
                  width: 12,
                ),
                if (currentStep != 0)
                  Expanded(
                      child: ElevatedButton(
                          onPressed: details.onStepCancel,
                          child: Text('Back'))),
              ],
            ),
          );
        },
      ),
    ));
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('Request type'),
          content: Center(
            child: Column(
              children: [
                Text(
                  'Choose which type of a request u would like to make',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DropdownButtonFormField(
                    hint: Text('Select'),
                    items: [
                      DropdownMenuItem(
                        value: "-1",
                        child: Text('Money Donation request'),
                      ),
                      DropdownMenuItem(
                        value: "1",
                        child: Text('Volunteer request'),
                      )
                    ],
                    value: _value,
                    onChanged: (v) {},
                  ),
                )
              ],
            ),
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text('Info'),
          content: Column(
            children: [
              Text(
                'Please fill in the required info',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: Title,
                decoration: InputDecoration(
                    hintText: 'write the title',
                    labelText: 'Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: Description,
                minLines: 2,
                maxLines: 6,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: 'Enter a description',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: Phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: 'Phone number',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: Address,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                    hintText: 'Address',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)))),
              ),
              TextFormField(
                controller: Bank,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: 'Bank Account number',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)))),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: Text('Image'),
          content: Column(
            children: [
              Text(
                'Please submit a message that is related to the request',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Picture()
            ],
          ),
        )
      ];
}
