import 'package:flutter/material.dart';

class WordMoreInfo extends StatelessWidget {
  const WordMoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16 , right: 8 , left: 8),
      child: Container(
          decoration:  BoxDecoration(
          color:  const Color.fromARGB(255, 248, 248, 248),
          borderRadius: BorderRadius.circular(24),  
          ) , 
          child:  const Padding(
            padding: EdgeInsets.only(top: 12.0 ,left : 6 , right : 12 , bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                              padding: EdgeInsets.only(left : 8.0),
                              child: Row(
                                children: [
                                  TagsCard(color : Color.fromARGB(255 ,250,204,181,) , text: "beginner",),
                                  SizedBox(width: 4,) ,
                                  TagsCard(color : Color.fromARGB(255 ,222,213,246,) , text: "@ tags",),
                                  SizedBox(width: 4,) ,
                                  TagsCard(color : Color.fromARGB(255 ,222,213,246,), text: "@ easy",),
                                ],
                              )
                            ) , 
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                      Text("added: 8/05/2025" , 
                      style: TextStyle(
                         fontFamily: "roboto" , 
                         fontSize: 14 , 
                         fontWeight: FontWeight.w600 , 
                                                                 
                               color: Color.fromARGB(255, 59, 59, 59),
                                      ) ,)
                  ],
                ) , 
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                      Text(" last reviewed : 8/05/2025", 
                      style: TextStyle(
                                                                fontFamily: "roboto" , 
                                                                fontSize: 14 , 
                                                                fontWeight: FontWeight.w600 , 
                                                                 
                               color: Color.fromARGB(255, 59, 59, 59),
                                      ) ,), 
                  ],
                  )
              ],
            ),
          ),
      ) 
    );
  }
}


class TagsCard extends StatelessWidget {
  final Color color  ; 
  final  String text ; 
  const TagsCard({super.key , required this.color ,  required this.text });

  @override
  Widget build(BuildContext context) {
    return Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6) , 
                                                    color: color
                                                  ),
                                                  child:  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4.0 , vertical: 2.5),
                                                    child: Text( text  , 
                                      style: const TextStyle(
                                                                fontFamily: "roboto" , 
                                                                fontSize: 14 , 
                                                                fontWeight: FontWeight.w600 , 
                                                                 
                               color: Color.fromARGB(255, 59, 59, 59),
                                      ) ,),
                                                  ),
                              
                                                );
  }
}