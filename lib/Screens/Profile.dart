// // // ignore_for_file: deprecated_member_use

// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';

// // class profile extends StatefulWidget {
// //   @override
// //   _profilestate createState() => _profilestate();
// // }

// // class _profilestate extends State<profile> {
// //   File? _image;
// //   final picker = ImagePicker();

// //   Future getImage(ImageSource source) async {
// //     final pickedFile = await picker.getImage(source: source);
// //     setState(() {
// //       if (pickedFile != null) {
// //         _image = File(pickedFile.path);
// //       } else {
// //         print('No image selected.');
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children: [
// //           const SizedBox(
// //             height: 30,
// //           ),
// //           const Padding(
// //             padding: EdgeInsets.only(left: 20),
// //             child: Text(
// //               'Profile',
// //               style: TextStyle(
// //                 fontSize: 35,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //           ),
// //           const SizedBox(
// //             height: 50,
// //           ),
// //           CircleAvatar(
// //             radius: 70,
// //             child: _image != null
// //                 ? ClipRRect(
// //                     borderRadius: BorderRadius.circular(70),
// //                     child: Image.file(
// //                       _image!,
// //                       fit: BoxFit.cover,
// //                       width: 140,
// //                       height: 140,
// //                     ),
// //                   )
// //                 : const Icon(
// //                     Icons.person,
// //                     size: 70,
// //                   ),
// //           ),
// //           const SizedBox(
// //             height: 20,
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               IconButton(
// //                 onPressed: () {
// //                   getImage(ImageSource.camera);
// //                   Navigator.pop(context);
// //                 },
// //                 icon: const Icon(Icons.camera_alt),
// //               ),
// //               const SizedBox(
// //                 width: 20,
// //               ),
// //               IconButton(
// //                 onPressed: () {
// //                   getImage(ImageSource.gallery);
// //                   Navigator.pop(context);
// //                 },
// //                 icon: const Icon(Icons.image),
// //               ),
// //             ],
// //           ),
// //           const SizedBox(
// //             height: 50,
// //           ),
// //           const Expanded(
// //             child: DefaultTabController(
// //               length: 2,
// //               child: Scaffold(
// //                 appBar: TabBar(
// //                   tabs: [
// //                     Tab(
// //                       text: 'Saved',
// //                     ),
// //                     Tab(
// //                       text: 'Notification',
// //                     ),
// //                   ],
// //                 ),
// //                 backgroundColor: Colors.lightBlue,
// //                 body: TabBarView(
// //                   children: [
// //                     Center(
// //                       child: Text(
// //                         'Saved',
// //                         style: TextStyle(
// //                           color: Colors.green,
// //                         ),
// //                       ),
// //                     ),
// //                     Center(
// //                       child: Text(
// //                         'Notification',
// //                         style: TextStyle(
// //                           color: Colors.green,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// //trial
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class profile extends StatefulWidget {
//   const profile({Key? key}) : super(key: key);

//   @override
//   State<profile> createState() => profileState();
// }

// class profileState extends State<profile> {
//   String selectedImagePath = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 15, top: 150, right: 15),
//           child: Column(
//             children: [
//               selectedImagePath == ''
//                   ? Image.asset(
//                       'assets/images/1',
//                       height: 11,
//                       width: 100,
//                       fit: BoxFit.fill,
//                     )
//                   : Image.file(
//                       File(selectedImagePath),
//                       height: 20,
//                       width: 20,
//                       fit: BoxFit.fill,
//                     ),
//               Text(
//                 'Select Image',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               ElevatedButton(
//                   style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(Colors.lightGreen),
//                       padding:
//                           MaterialStateProperty.all(const EdgeInsets.all(20)),
//                       textStyle: MaterialStateProperty.all(
//                           const TextStyle(fontSize: 14, color: Colors.white))),
//                   onPressed: () async {
//                     selectImage();
//                     setState(() {});
//                   },
//                   child: const Text('Select')),
//               const SizedBox(height: 10),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future selectImage() {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0)), //this right here
//             child: Container(
//               height: 150,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       'Select Image From !',
//                       style: TextStyle(
//                           fontSize: 18.0, fontWeight: FontWeight.bold),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         GestureDetector(
//                           onTap: () async {
//                             selectedImagePath = await selectImageFromGallery();
//                             print('Image_Path:-');
//                             print(selectedImagePath);
//                             if (selectedImagePath != '') {
//                               Navigator.pop(context);
//                               setState(() {});
//                             } else {
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(SnackBar(
//                                 content: Text("No Image Selected !"),
//                               ));
//                             }
//                           },
//                           child: Card(
//                               elevation: 5,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Image.asset(
//                                       'assets/images/gallery.png',
//                                       height: 60,
//                                       width: 60,
//                                     ),
//                                     Text('Gallery'),
//                                   ],
//                                 ),
//                               )),
//                         ),
//                         GestureDetector(
//                           onTap: () async {
//                             selectedImagePath = await selectImageFromCamera();
//                             print('Image_Path:-');
//                             print(selectedImagePath);

//                             if (selectedImagePath != '') {
//                               Navigator.pop(context);
//                               setState(() {});
//                             } else {
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(SnackBar(
//                                 content: Text("No Image Captured !"),
//                               ));
//                             }
//                           },
//                           child: Card(
//                               elevation: 5,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Image.asset(
//                                       'assets/images/camera.png',
//                                       height: 60,
//                                       width: 60,
//                                     ),
//                                     Text('Camera'),
//                                   ],
//                                 ),
//                               )),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }

//   selectImageFromGallery() async {
//     XFile? file = await ImagePicker()
//         .pickImage(source: ImageSource.gallery, imageQuality: 10);
//     if (file != null) {
//       return file.path;
//     } else {
//       return '';
//     }
//   }

//   //
//   selectImageFromCamera() async {
//     XFile? file = await ImagePicker()
//         .pickImage(source: ImageSource.camera, imageQuality: 10);
//     if (file != null) {
//       return file.path;
//     } else {
//       return '';
//     }
//   }
// }
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
