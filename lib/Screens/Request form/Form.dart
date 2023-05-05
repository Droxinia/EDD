import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormFillInPage extends StatefulWidget {
  const FormFillInPage({Key? key}) : super(key: key);

  @override
  _FormFillInPageState createState() => _FormFillInPageState();
}

class _FormFillInPageState extends State<FormFillInPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _bankAccountController = TextEditingController();

  File? _imageFile;
  final picker = ImagePicker();

  Future<void> _getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() && _imageFile != null) {
      // All form fields are valid and image is selected
      final title = _titleController.text.trim();
      final description = _descriptionController.text.trim();
      final phone = _phoneController.text.trim();
      final address = _addressController.text.trim();
      final bankAccount = _bankAccountController.text.trim();
      final timestamp = DateTime.now().toString();

      // Upload image to Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('donation_images/$timestamp.jpg');
      await storageRef.putFile(_imageFile!);
      final imageUrl = await storageRef.getDownloadURL();

      // Save donation data to Firebase Firestore
      final firestore = FirebaseFirestore.instance;
      final donationData = {
        'title': title,
        'description': description,
        'phone': phone,
        'address': address,
        'bankAccount': bankAccount,
        'imageUrl': imageUrl,
        'timestamp': timestamp,
      };
      await firestore.collection('donations').add(donationData);

      // Show success message and go back to previous screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Donation request submitted successfully')),
      );
      Navigator.pop(context);
    } else {
      // Form fields are not valid or image is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Please fill all form fields and select an image')),
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _bankAccountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SafeArea(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.camera_alt),
                                title: Text('Take a picture'),
                                onTap: () {
                                  _getImageFromCamera();
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.photo_library),
                                title: Text('Pick from gallery'),
                                onTap: () {
                                  _getImageFromGallery();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _imageFile == null
                        ? Icon(
                            Icons.add_a_photo,
                            size: 50,
                            color: Colors.grey,
                          )
                        : Image.file(_imageFile!, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please enter an address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _bankAccountController,
                  decoration: InputDecoration(
                    labelText: 'Bank Account Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please enter a bank account number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Request'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
