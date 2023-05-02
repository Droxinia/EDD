// ignore_for_file: prefer_const_constructors

// import 'dart:ffi';
// import 'dart:io';
// import 'package:edd/Screens/Register/Register.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'Register/signin.dart';

// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   File? _image;

//   void _setImage(File? image) {
//     setState(() {
//       _image = image;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser!;
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 90,
//             ),
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: const Color.fromARGB(255, 207, 202, 202),
//                     radius: 70,
//                     child: _image != null
//                         ? ClipRRect(
//                             borderRadius: BorderRadius.circular(70),
//                             child: Image.file(
//                               _image!,
//                               fit: BoxFit.cover,
//                               width: 140,
//                               height: 140,
//                             ),
//                           )
//                         : const Icon(
//                             Icons.person,
//                             size: 70,
//                           ),
//                   ),
//                   IconButton(
//                     onPressed: () async {
//                       // ignore: deprecated_member_use
//                       final pickedFile = await ImagePicker().getImage(
//                         source: ImageSource.gallery,
//                       );
//                       if (pickedFile != null) {
//                         _setImage(File(pickedFile.path));
//                       }
//                     },
//                     icon: const Icon(Icons.camera),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             const Text(
//               'Email:',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 68, 127, 238),
//               ),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             Text(
//               user.email!,
//               style: const TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 0, 0, 0),
//               ),
//             ),
//             const Spacer(),
//             ElevatedButton(
//               onPressed: () async {
//                 await FirebaseAuth.instance.signOut();
//                 // ignore: use_build_context_synchronously
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const Register(),
//                   ),
//                 );
//               },
//               child: const Text('Logout'),
//             ),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// void main() {
//   runApp(Profile());
// }

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;
  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CircleAvatar(
            radius: 70,
            // backgroundImage: _image != null
            //     ? FileImage(_image)
            //     : AssetImage('assets/images/profile_placeholder.png'),
            // backgroundImage:
            // if(_image !=null) {

            //    FileImage(_image)
            // }else{
            //   AssetImage('assets/images/profile_placeholder.png'),
            // }
            // ,
            child: _image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.file(
                      _image!,
                      fit: BoxFit.cover,
                      width: 140,
                      height: 140,
                    ),
                  )
                : const Icon(
                    Icons.person,
                    size: 70,
                  ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: TabBar(
                  tabs: const [
                    Tab(
                      text: 'Saved',
                    ),
                    Tab(
                      text: 'Notification',
                    ),
                  ],
                ),
                body: TabBarView(
                  children: const [
                    Center(
                      child: Text('Saved'),
                    ),
                    Center(
                      child: Text('Notification'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.camera_alt),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.image),
              ),
            ],
          )
        ],
      ),
    );
  }
}
