import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final picker = ImagePicker();
  File? _image;

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadImageToFirebase() async {
    if (_image != null) {
      final storage = FirebaseStorage.instance;
      final reference =
          storage.ref().child('user_avatars/${DateTime.now().toString()}');
      final uploadTask = reference.putFile(_image!);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      // You can store the downloadUrl in Firestore or Realtime Database
      print('Download URL: $downloadUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.camera_alt),
                            title: Text('Take a picture'),
                            onTap: () async {
                              Navigator.pop(context);
                              await getImageFromCamera();
                              await uploadImageToFirebase();
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.photo_library),
                            title: Text('Choose from gallery'),
                            onTap: () async {
                              Navigator.pop(context);
                              await getImageFromGallery();
                              await uploadImageToFirebase();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey[200],
                child: _image == null
                    ? Icon(Icons.person, size: 80, color: Colors.grey)
                    : ClipOval(
                        child: Image.file(_image!,
                            width: 160, height: 160, fit: BoxFit.cover),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
