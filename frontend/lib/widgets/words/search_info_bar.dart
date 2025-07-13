import 'package:flutter/material.dart';
import 'package:wordsapp/widgets/utils/total_words_stats.dart';

class SearchandInfoBar extends StatelessWidget {
  const SearchandInfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom : 20.0),
      child: Column(
        children: [
Container(
  height: 43,
  decoration: BoxDecoration(
    color: const Color.fromARGB(255, 244, 244, 244),
    borderRadius: BorderRadius.circular(12),
  ),
  child:  TextField(
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(top : 6),
      hintText: 'Search',
      hintStyle: const TextStyle(
        fontFamily: "roboto", 
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 138, 138, 138),
         ),
border: InputBorder.none, 
      enabledBorder: InputBorder.none, 
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 183, 183, 183),
          width: 0.3
        ),
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 8.0 , top: 10 , bottom: 10),
        child: Image.asset("Assets/firstcolor/search-3.png" , height: 12,),
      )
    ),
  ),
),
const Padding(
  padding: EdgeInsets.only(top :10.0),
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        TotalWordsStats(name: "Nouns", number: "12" , color: Color.fromARGB(255 ,250,204,181,),) ,
        SizedBox(width: 8,) ,  
        TotalWordsStats(name: "Adjectives", number: "14" , color: Color.fromARGB(255 ,189,231,255,),) ,
        SizedBox(width: 8,) , 
         TotalWordsStats(name: "Verbs", number: "02" , color: Color.fromARGB(255 ,222,213,246,),) ,
        SizedBox(width: 8,) , 
         TotalWordsStats(name: "Expert at ", number: "12" , color: Color.fromARGB(255 ,244,233,205,),) ,
    
       
        
      ],
    ),
  ),
)
        ],
      ),
    );
  }
}