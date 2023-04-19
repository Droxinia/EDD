import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'About us.dart';
// import 'package:settingspage/About%20us.dart';

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
                  Text('settings'.tr().toString(),style: TextStyle(fontSize:32, fontWeight: FontWeight.bold),
                  ),
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
                        Text('languages'.tr().toString(), style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),),
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
                  
                  (barrierDismissible: true,barrierLabel: 'languages'.tr().toString(),context:context, pageBuilder: ((context, animation, secondaryAnimation) => Center(
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
                        body: Center(
                          child: Column(children: [
                            Text('languages'.tr().toString(), style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                            Padding( 
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text('change-language'.tr().toString(),textAlign: TextAlign.center,),
                            ),
                           GestureDetector(
                            onTap: () => context.locale = const Locale('en','US'),   
                             child: Container(
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [CircleAvatar(backgroundImage: AssetImage('assets/images/1.jpg'), radius: MediaQuery.of(context).size.height *0.02,),
                                  Text('English'),
                                ],
                              )),
                             ),
                           ),
                           SizedBox(height: 10,),
                           GestureDetector(
                            onTap: () => context.locale = const Locale('am','ETH'),
                             child: Container(
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(
                                
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [CircleAvatar(backgroundImage: AssetImage('assets/images/2.jpg'), radius: MediaQuery.of(context).size.height *0.02,),
                                  Text('amharic'.tr().toString()),
                                ],
                              ),
                              ),
                             ),
                           ),
                          ],),
                        ),
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
                        Text('about-us'.tr().toString(), style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),),
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
                      Navigator.push(
                          context,
                              MaterialPageRoute(builder: (context) => const About_us()),
                      );
                    }
              )
            ],
            ),
        ),
          )
    );
  }
}