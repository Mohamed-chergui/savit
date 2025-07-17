import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left : 20.0 , top: 12),
      child: Row(
        children: [
          const Row(
            children: [
              Text("Savit" , style: TextStyle(
                fontFamily: "roboto",
                          fontSize: 30 , 
                          fontWeight: FontWeight.w800 , 
              ), ),
              Padding(
            padding: EdgeInsets.only(top : 8.0 , left: 8 ),
            child: Text("Bahae eddine " , style: TextStyle(
              fontFamily: "roboto",
                        fontSize: 20 , 
                        fontWeight: FontWeight.w800 , 
            ), ),
          ) , 
            ],
          ) , 
      
          
          Container()
      
        ],
      ),
    );
  }
}