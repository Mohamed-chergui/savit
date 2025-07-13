import 'package:flutter/material.dart';
import 'package:wordsapp/widgets/utils/settingsPage/profile_settings.dart';
import 'package:wordsapp/widgets/utils/settingsPage/theme_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 250, 250, 250),
         title: const Text('settings '  , 
      style: TextStyle(
                    fontFamily: "roboto" , 
                    fontSize: 20 , 
                    fontWeight: FontWeight.w700 , 
                     
                       color: Color.fromARGB(255, 59, 59, 59),
      ) ,),
      actions:  [
       GestureDetector(
        onTap: () {

        },
        child :   const Padding(
         padding: EdgeInsets.only( right : 15.0 , top: 4),
          child: Icon(Icons.info_outline_rounded),
        ) )
      ],
      ),
      body:  const SafeArea(child: 
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ProfileSettings(),
            ) , 
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ThemeSettings(),
            ) ,
        
          ],
        ),
      )) ,
    );
  }
}