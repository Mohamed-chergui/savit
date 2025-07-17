import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/settings_provider.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context) ; 
    final settingsProvider = Provider.of<SettingsProvider>(context) ;  
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(14)),
      child:   Padding(
        padding: const EdgeInsets.only(top : 12.0 , left : 12 , bottom: 20 ),
        child: Padding(
          padding: const EdgeInsets.only(top : 8.0 , left: 4 , right: 12 ),
          child: Column(
            children: [
               const Row( children: [
                Text("Appearance" , 
                style: TextStyle( fontFamily: "roboto" , 
                fontSize: 17 , 
                fontWeight: FontWeight.w700 , 
                                  ) ,), 
              ],) , 
              Padding(
                padding: const EdgeInsets.only(top : 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Dark mode", style: TextStyle(
                      fontFamily: "roboto" , 
                      fontSize: 15, 
                    ),), 
                    Platform.isIOS ? Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            activeColor: const Color.fromARGB(255, 129, 154, 145),
                            value: settingsProvider.isDarkMode    , 
                            onChanged: (value) {
                               settingsProvider.setIsDarkMode(value) ; 
                            },
                          ),
                        )   : Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            value: settingsProvider.isDarkMode ,
                            onChanged: (value) {
                              settingsProvider.setIsDarkMode(value) ;
                            },
                          ),
                        ) ,
                  ],
                ),
              ) , 
                            Padding(
                padding: const EdgeInsets.only(top : 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Perfect reversing", style: TextStyle(
                      fontFamily: "roboto" , 
                      fontSize: 15, 
                    ),), 
                    Platform.isIOS ? Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            activeColor: const Color.fromARGB(255, 129, 154, 145),
                            value:    settingsProvider.isReversed  , 
                            onChanged: (value) {
                              settingsProvider.setIsReversed(value) ; 
                            },
                          ),
                        )   : Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            value: settingsProvider.isReversed  ,
                            onChanged: (value) {
                               settingsProvider.setIsReversed(value) ; 
                            },
                          ),
                        ) ,
                  ],
                ),
              ) , 
               Padding(
                 padding: const EdgeInsets.only(top : 24.0 , bottom: 18 , left: 6, right: 6),
                 child: Container(
                  width: double.infinity,
                  height: 0.4,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 37, 37, 37)
                  ),
                               ),
               ) ,
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row( children: [
                    Text("Main color" , 
                    style: TextStyle(
                          fontFamily: "roboto" , 
                          fontSize: 15, 
                        ),) , 
                  
                  ],),
                    Padding(
                      padding: const EdgeInsets.only(top : 8.0),
                      child: SizedBox(
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 1, 
                          runSpacing: 4,
                          children: List.generate(settingsProvider.mainColorOptions.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                settingsProvider.setMainColorIndex(index);
                              },
                              child: ColorCard(
                                cardColor: settingsProvider.mainColorOptions[index] ,
                                index: index,
                              ),
                            );
                          }),
                        ),
                      ),
                    )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


class ColorCard extends StatelessWidget {
  final  Color cardColor ;
 final int index ;  
  const ColorCard({super.key , required this.cardColor  ,  required this.index});

  @override
  Widget build(BuildContext context) { 
    final settingsProvider = Provider.of<SettingsProvider>(context) ;
    return Padding(
      padding: const EdgeInsets.only(left : 2.0),
      child: Container(
        decoration:  BoxDecoration(
          shape: BoxShape.circle , 
          color: cardColor , 
          border: Border.all(color: const Color.fromARGB(255, 190, 190, 190) , width: 0.5)
        ),
        height: settingsProvider.mainColorindex == index ?  44 : 38,
        width:settingsProvider.mainColorindex == index ?  44 : 38 ,
        child: AnimatedOpacity  (opacity:  settingsProvider.mainColorindex ==  index ? 1 : 0  , duration: const Duration(milliseconds: 200),
         child: 
         Padding(
           padding: const EdgeInsets.only(right : 10.0 ,bottom: 6 ),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Container(
                 decoration :
                 BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all( color: const Color.fromARGB(255, 53, 53, 53))),
                  height: 20,
                  width: 20 ,  
                  child:  Center(child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(child: Icon(Icons.check , color: settingsProvider.textColor()  , size: 16,) ),
                  )),
               )
             ],
           ),
         )
           ),  
      ),
    );
  }
}