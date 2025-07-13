


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/wods_provider_logic/words.dart';

class SettingWithSwitch extends StatefulWidget {
   final  String typeOfSetting; 
   final String nameOfSetting ; 
   const SettingWithSwitch({super.key , required this .  typeOfSetting , required this.nameOfSetting});

  @override
  State<SettingWithSwitch> createState() => _SettingWithSwitchState();
}

class _SettingWithSwitchState extends State<SettingWithSwitch> {
    

   
  @override
  Widget build(BuildContext context) {
    final words = Provider.of<WordsProvider>(context, listen: true );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          widget.nameOfSetting,
          style: const TextStyle(
            fontFamily: "roboto",
            fontSize: 15.5,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 53, 53, 53),
          ),
        ),
        Platform.isIOS ? Transform.scale(
          scale: 0.8,
          child: CupertinoSwitch(
            activeColor: const Color.fromARGB(255, 129, 154, 145),
            value: words.handleTypeOfSetting(widget.typeOfSetting)   , 
            onChanged: (value) {
                 words.changeBooleanbSettings(widget.typeOfSetting, value ) ; 
            },
          ),
        )   : Transform.scale(
          scale: 0.8,
          child: Switch(
            value: words.handleTypeOfSetting(widget.typeOfSetting),
            onChanged: (value) {
             words.changeBooleanbSettings(widget.typeOfSetting, value ) ; 
            },
          ),
        ) ,
      ],
    );
  }
}




class SettingwithCheckBox extends StatefulWidget {
  final  String typeOfSetting; 
  final String nameOfSetting ; 
  final String shape ;  
    const SettingwithCheckBox({super.key , required this.nameOfSetting , required this.typeOfSetting , required this.shape});

  @override
  State<SettingwithCheckBox> createState() => _SettingwithCheckBoxState();
}

class _SettingwithCheckBoxState extends State<SettingwithCheckBox> {
  @override
  Widget build(BuildContext context) {
    final words = Provider.of<WordsProvider>(context, listen: true );
    return Row(
      mainAxisAlignment: widget.shape == "circle" ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
      children: [
         Text(
          widget.nameOfSetting,
          style: const TextStyle(
            fontFamily: "roboto",
            fontSize: 15.5,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 53, 53, 53),
          ),
        ),
         Transform.scale(
          scale:  widget.shape == "circle" ? 1.2 : 0.9,
           child: Checkbox( 
                  side: const BorderSide(
            color: Color.fromARGB(255, 129, 154, 145),
            width: 1.3,
          ),
            focusColor: const Color.fromARGB(255, 129, 154, 145),
            checkColor: Colors.white,
            activeColor: const Color.fromARGB(255, 129, 154, 145),
             shape: widget.shape == "circle" ?  const CircleBorder() : null ,
             value: words.handleTypeOfSetting(widget.typeOfSetting)   , 
             onChanged: (value) {
                  words.changeBooleanbSettings(widget.typeOfSetting, value! ) ; 
             },
           ),
         )  
      ],
    );
  }
}