// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Donationrequest extends StatefulWidget {
  const Donationrequest({super.key});

  @override
  State<Donationrequest> createState() => _DonationrequestState();
}

class _DonationrequestState extends State<Donationrequest> {
  late File _image;
  final imagePicker = ImagePicker();

  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Image:'),
              Container(
                height: 30,
                width: 30,
                child: _image == null ? Text('No image') : Image.file(_image),
              ),
              IconButton(
                  onPressed: getImage, icon: const Icon(Icons.camera_alt))
            ],
          ),
        ],
      ),
    )));
  }
}
