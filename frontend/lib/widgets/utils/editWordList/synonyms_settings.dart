import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/word_provider.dart';
import 'package:wordsapp/widgets/utils/editWordList/word_details_text_field.dart';

class SynonymsSettings extends StatelessWidget {
  const SynonymsSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final word = Provider.of<WordProvider>(context);
    return  AnimatedSize(
duration: const Duration(milliseconds: 300), 
 curve: Curves.easeInOut,
      child: Container(
        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 245 , 245),
                          borderRadius: BorderRadius.circular(14)
      
                        ),
        child:   Column(
          children: [
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Synonyms",  style: TextStyle(
                                            fontFamily: "roboto" , 
                                            fontSize: 16 , 
                                            fontWeight: FontWeight.w700 , 
                                              color: Color.fromARGB(255, 59, 59, 59),
                              ) ,),
                  ),
                  Row(
                    children: [
                       GestureDetector(
                                   onTap: () {
                                     word.setHideSynonymes() ; 
                                             },
                                                       child: Text( !word.hideWordSynonyms ? "hide" : "show" , style: const TextStyle(
                                                         fontWeight: FontWeight.w400 ,  decorationColor:  Color.fromARGB(200, 3, 3, 3) , 
                                                          decorationThickness: 1.0, 
                                                       color: Color.fromARGB(200, 3, 3, 3) , )
                      
                                                       ),) , 
                                                       Padding(
                                                         padding: const EdgeInsets.only(left : 8.0),
                                                         child: GestureDetector
                                                           (
                                                             onTap: () {
                                                                word.addSynonyme() ; 
                                                             },
                                                             child: const Icon(Icons.add , color: Color.fromARGB(255, 59, 59, 59), )),
                                                       ),
                                                       ],
                                                     ) ,
                ],
              ),
             ),
             ! word.hideWordSynonyms ?   Column(
              children: List.generate(word.synonymesControllers.length ,  (index){
                return Padding(
                  padding: const EdgeInsets.only( bottom: 0 , left: 16, right : 16 ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      
                      Column(
                        children: [
                          WordDetailsTextField(text: "Synonyme", controller: word.synonymesControllers[index] , maxLine: true,),
                        ],
                      ) ,
                       Padding(
                        padding: const EdgeInsets.only(top : 8.0),
                        child: GestureDetector(
                          onTap: () {
                            word.deleteSynonyme(index) ;
                          },
                          child: const Icon(Icons.delete_outline_rounded , 
                          color: Color.fromARGB(255, 59, 59, 59),),
                        ),
                      ) ,   
                    ],
                  ),
                ) ; 
              }),
            ) : const SizedBox.shrink() ,

            Padding(
              padding: const EdgeInsets.only( top : 28.0 , left :8 , right : 8 ) ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Antonyms",  style: TextStyle(
                                            fontFamily: "roboto" , 
                                            fontSize: 16 , 
                                            fontWeight: FontWeight.w700 , 
                                              color: Color.fromARGB(255, 59, 59, 59),
                              ) ,),
                  ),
                  Row(
                    children: [
                       GestureDetector(
                                   onTap: () {
                                     word.setHideAnotyms() ; 
                                             },
                                                       child: Text( !word.hideWordAntonyms ? "hide" : "show" , style: const TextStyle(
                                                         fontWeight: FontWeight.w400 ,  decorationColor:  Color.fromARGB(200, 3, 3, 3) , 
                                                          decorationThickness: 1.0, 
                                                       color: Color.fromARGB(200, 3, 3, 3) ,
                      
                                                       ),)) , 
                                                       Padding(
                                                         padding: const EdgeInsets.only(left : 8.0),
                                                         child: GestureDetector
                                                           (
                                                             onTap: () {
                                                                word.addAntonyme() ; 
                                                             },
                                                             child: const Icon(Icons.add , color: Color.fromARGB(255, 59, 59, 59), )),
                                                       ),
                                                       ],
                                                     ),
                ],
              ),
            ), 

                      ! word.hideWordAntonyms ?   Column(
              children: List.generate(word.antonymsControllers.length ,  (index){
                return Padding(
                  padding: const EdgeInsets.only( bottom: 0 , left: 16, right : 16 ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      
                      Column(
                        children: [
                          WordDetailsTextField(text: "Antonyms", controller: word.antonymsControllers[index] , maxLine: true,),
                        ],
                      ) ,
                       Padding(
                        padding: const EdgeInsets.only(top : 8.0),
                        child: GestureDetector(
                          onTap: () {
                            word.deleteAntonym(index) ;
                          },
                          child: const Icon(Icons.delete_outline_rounded , 
                          color: Color.fromARGB(255, 59, 59, 59),),
                        ),
                      ) ,   

                    ],
                  ),
                ) ; 
              }),
            )  : const SizedBox.shrink(),
            const SizedBox(height: 12) ,

          ],
        ),
      ),
    );
  }
}