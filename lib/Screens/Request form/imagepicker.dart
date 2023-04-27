// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Picture extends StatefulWidget {
  const Picture({super.key});

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (imageFile != null)
          Container(
            width: 640,
            height: 480,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(image: FileImage(imageFile!)),
                border: Border.all(width: 8, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            child: Text('place your Image'),
          )
        else
          Container(
            width: 640,
            height: 480,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(width: 8, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            child: Text('place your Image'),
          ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () => getImage(source: ImageSource.camera),
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.blueGrey,
                )),
            SizedBox(
              width: 80,
            ),
            IconButton(
                onPressed: () => getImage(source: ImageSource.gallery),
                icon: Icon(
                  Icons.file_copy,
                  color: Colors.blueGrey,
                ))
          ],
        )
      ],
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}
