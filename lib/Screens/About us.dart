import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class About_us extends StatelessWidget {
  const About_us({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 50),
          child: Column(
            children: [
            Row(
               children: [ Icon(Icons.info, color: Colors.lightBlue.shade200,),
                  Text('about-us'.tr().toString(),style: TextStyle(fontSize:32, fontWeight: FontWeight.bold),
                  ),
                ],

            )
          ],
          ),
          )
        ),
        floatingActionButton: FloatingActionButton(
             child: const Icon(Icons.arrow_back_ios),
          onPressed: () {
              Navigator.pop(context);
            }
      ), 
    );
  }
}