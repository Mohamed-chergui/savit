import 'package:flutter/material.dart';
import 'package:wordsapp/widgets/utils/editWordList/drop_down_for_settings.dart';
import 'package:wordsapp/widgets/utils/editWordList/word_details_text_field.dart';


class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context) ; 
    final TextEditingController userName = TextEditingController(text: "bahae eddine");
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(14)),
      child:  Padding(
        padding: const EdgeInsets.only(top : 12.0 , left : 12 , bottom: 24 ),
        child: Padding(
          padding: const EdgeInsets.only(top : 8.0 , left: 4 , right: 12 ),
          child: Column(
            children: [
              const Row( children: [
                Text("Personal profile" , 
                style: TextStyle( fontFamily: "roboto" , 
                fontSize: 17 , 
                fontWeight: FontWeight.w700 , 
                color: Color.fromARGB(255, 59, 59, 59),
                                  ) ,), 
              ],) , 
              Padding(
                padding: const EdgeInsets.only(top : 18.0),
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