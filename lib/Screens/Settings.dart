import 'dart:ui';

import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: [
              Row(
                children: [ Icon(Icons.settings, color: Colors.lightBlue.shade200,),
                  Text('Settings',style: TextStyle(fontSize:32, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 30,),
              InkWell(
                child: Container(
                  child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Icon(Icons.language,color: Colors.lightBlue,),
                        ),
                        SizedBox(width: 5,),
                        Text('Language', style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),),
                        const Spacer(),
                        Container(
                          height: 50,
                          width: 50,
                          // color: Colors.grey,
                          child: Icon(Icons.arrow_forward_ios,color: Colors.lightBlue,),
                        ),
                      ],
                    ),
                ),
                onTap: () {
                  showGeneralDialog
                  
                  (barrierDismissible: true,barrierLabel: 'Languages',context:context, pageBuilder: ((context, animation, secondaryAnimation) => Center(
                    child: Container(
                      height: 320,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.symmetric(vertical: 32,horizontal: 24),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Column(children: [
                          Text('Languages', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                          Padding( 
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text('     Choose a differnet Language:                                                        ',textAlign: TextAlign.center,),
                          ),
                         Container(
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(child: Text('English')),
                         ),
                         SizedBox(height: 10,),
                         Container(
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                            
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(child: Row(
                            children: [CircleAvatar(child: Image(image: AssetImage('assets/2.jpg')),),
                              Text('Amharic'),
                            ],
                          ),
                          ),
                         ),
                         SizedBox(height: 10,),
                         Container(
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(child: Text('Oromiya')),
                         ),
             
                        ],),
                      ),
                    ),
                  )
                  ),
                  );                  
                },
              ),
                
                
                
                
                
                
                
                
                
                
                SizedBox(height: 10,),
              InkWell(
                child: Container(
                  child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Icon(Icons.info,color: Colors.lightBlue,),
                        ),
                        SizedBox(width: 5,),
                        Text('About us', style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),),
                        const Spacer(),
                        Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.arrow_forward_ios,color: Colors.lightBlue,),
                        ),
                      ],
                    ),
                ),
                onTap: () {
                  
                },
              )
            ],
            ),
        ),
          )
    );
  }
}