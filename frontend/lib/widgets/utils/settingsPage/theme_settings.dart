import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/collections.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 245 , 245),
        borderRadius: BorderRadius.circular(14)),
      child:   Padding(
        padding: const EdgeInsets.only(top : 12.0 , left : 12 , bottom: 20 ),
        child: Padding(
          padding: const EdgeInsets.only(top : 8.0 , left: 4 , right: 12 ),
          child: Column(
            children: [
              const Row( children: [
                Text("Theme" , 
                style: TextStyle( fontFamily: "roboto" , 
                fontSize: 16 , 
                fontWeight: FontWeight.w700 , 
                color: Color.fromARGB(255, 59, 59, 59),
                                  ) ,), 
              ],) , 
              Padding(
                padding: const EdgeInsets.only(top : 8.0),
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
                            value: true    , 
                            onChanged: (value) {
                            },
                          ),
                        )   : Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            value: true ,
                            onChanged: (value) {
                             
                            },
                          ),
                        ) ,
                  ],
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
                  SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: 4 ,
        itemBuilder: (context, index) {
           return Row(
          children: [
           GestureDetector
           (
            onTap: () {
            },
            
            child: ColorCard(cardColor: Colors.greenAccent, index: index,))
        ],) ; 
        },
        scrollDirection: Axis.horizontal,
      ),
    ) ,


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
    final collections = Provider.of<Collection>(context , listen : false ) ; 
    return Padding(
      padding: const EdgeInsets.only(left : 2.0),
      child: Container(
        decoration:  BoxDecoration(
          shape: BoxShape.circle , 
          color: cardColor , 
          border: Border.all(color: const Color.fromARGB(255, 190, 190, 190) , width: 0.5)
        ),
        height: collections.colorPickedIndex == index ?  50 : 33,
        width:collections.colorPickedIndex == index ?  50 : 43 ,
        child: AnimatedOpacity  (opacity: collections.colorPickedIndex == index ? 1 : 0  , duration: const Duration(milliseconds: 200),
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
                  child: const Center(child: Padding(
                    padding: EdgeInsets.all(.0),
                    child: Center(child: Icon(Icons.check , color: Color.fromARGB(255, 53, 53, 53), size: 16,) ),
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