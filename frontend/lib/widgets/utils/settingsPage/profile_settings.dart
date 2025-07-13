import 'package:flutter/material.dart';
import 'package:wordsapp/screens/drop_down_for_settings.dart';
import 'package:wordsapp/widgets/utils/editWordList/word_details_text_field.dart';


class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userName = TextEditingController(text: "bahae eddine");
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 245 , 245),
        borderRadius: BorderRadius.circular(14)),
      child:  Padding(
        padding: const EdgeInsets.only(top : 12.0 , left : 12 , bottom: 20 ),
        child: Padding(
          padding: const EdgeInsets.only(top : 8.0 , left: 4 , right: 12 ),
          child: Column(
            children: [
              const Row( children: [
                Text("Personal profile" , 
                style: TextStyle( fontFamily: "roboto" , 
                fontSize: 16 , 
                fontWeight: FontWeight.w700 , 
                color: Color.fromARGB(255, 59, 59, 59),
                                  ) ,), 
              ],) , 
              Padding(
                padding: const EdgeInsets.only(top : 12.0),
                child: WordDetailsTextField( text: "User name", maxLine: false, controller: userName , maxLength: 20, icon: Icons.person_2_outlined,),
              ) , 
              WordDetailsTextField( text: "Email", maxLine: false, controller: userName, icon: Icons.email_rounded,) ,             
              const DropDownForSettings(types: ["male" ,"female" ,"animal"])           
            ],
          ),
        ),
      ),
    );
  }
}