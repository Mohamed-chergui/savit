import 'package:flutter/material.dart';

class TotalWordsStats extends StatelessWidget {
  final String name ; 
  final String number ; 
  final Color color ; 
  const TotalWordsStats({super.key , required this.color , required this.name , required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
       decoration: BoxDecoration(
            color:  const Color.fromARGB(255, 247, 247, 247),
            borderRadius: BorderRadius.circular(10
            ) , 
       ),
     child:   Padding(
       padding: const EdgeInsets.symmetric( horizontal: 12.0),
       child: Row(
        children: [
        Container(
          width: 10,
          decoration:  BoxDecoration(
          shape: BoxShape.circle , 
          color: color , 
        ),) , 
        const SizedBox(width: 2,) , 
         Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(name ,style: const TextStyle(
        fontFamily: "roboto", 
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color.fromARGB(255, 53, 53, 53),

         ),),
        ) , 
        const SizedBox(width:08,) , 
         Text(number ,
        style: const TextStyle(
          color: Colors.black54 ,
        ),) , 
       
        ],),
     )
    );
  }
}