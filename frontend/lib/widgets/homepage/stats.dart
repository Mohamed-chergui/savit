

import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  String selectedItem = "Words" ; 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left : 18.0 , bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
  height: 40,
  width: 101,
  decoration: BoxDecoration(
    color :  const Color.fromARGB(255, 231, 236, 215) ,
    borderRadius: const BorderRadius.all(Radius.circular(24)),
    border: Border.all(
      color: const Color.fromARGB(255, 129, 154, 145),
      width: 1.5,
    ),
  ),
  child: DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      selectedItemBuilder: (context) {
        return ['Words', 'Sentnece' , 'Added'].map((item) {
          return Padding(
            padding: const EdgeInsets.only(left  : 14.0  ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(item, style: const TextStyle(   fontFamily : "roboto"  , color: Color.fromARGB(255, 53, 53, 53), fontSize: 14)),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 53, 53, 53), size: 16),
              ],
            ),
          );
        }).toList();
      },
      value: selectedItem == '0' ? null : selectedItem,
      isDense: true,
      iconSize: 0, 
      dropdownColor:  const Color.fromARGB(255, 231, 236, 215) ,
      hint: const Text(
        'Select',
        style: TextStyle(color: Colors.black54, fontSize: 14),
      ),
      items: ['Words', 'Sentneces' , 'Last added'].map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedItem = value!;
        });
      },
    ),
  ),
) , 
          Padding(
            padding: const EdgeInsets.only(right : 18.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("Assets/firstcolor/clock-three.png" , height: 20,),
                ),
                const Text("Last Added : gemini" , style: TextStyle(
                  fontFamily: "roboto" , 
                  fontSize: 14
                ),)
              ],
            ),
          )
          ],


          
          ),
        ) , 
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right : 0.0 , top: 14),
                    child: Column(
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle , 
                            color: Colors.transparent,
                            border: Border.all(
                              width: 2 , 
                              color: const Color.fromARGB(255,  167, 193, 168),
                            ) 
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset("Assets/firstcolor/book.png"),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top : 5.0),
                          child: Text("New words" ,  style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500 , 
                            color: Color.fromARGB(255, 141, 141, 141)
                          ),),
                        ) ,
                        const Text("140" ,  style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold , 
                            color: Color.fromARGB(255, 53, 53, 53), 
                        ),)
                      ],
                      
                    ),
                  ) , 
                 Container(
                  
                  height: 120,
                  width: 1,
                   decoration: const BoxDecoration(
                    color: Colors.black12
                 ),) ,
                 Padding(
                    padding: const EdgeInsets.only(right : 0.0 , top: 14),
                    child: Column(
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle , 
                            color: Colors.transparent,
                            border: Border.all(
                              width: 2 , 
                              color: const Color.fromARGB(255,  167, 193, 168),
                            ) 
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset("Assets/firstcolor/badge.png"),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top : 5.0),
                          child: Text("Revised words" ,  style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500 , 
                            color: Color.fromARGB(255, 141, 141, 141)
                          ),),
                        ) ,
                        const Text("26" ,  style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold , 
                            color: Color.fromARGB(255, 53, 53, 53), 
                        ),)
                      ],
                      
                    ),
                  ) ,  
              
                      
              
                ],
              ),
            ),
          ),
        ),
      ],
    ) ; 
  }
}