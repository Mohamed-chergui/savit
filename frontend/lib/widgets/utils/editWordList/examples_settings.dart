import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/word_provider.dart';
import 'package:wordsapp/widgets/utils/editWordList/word_details_text_field.dart';

class ExamplesSettings extends StatelessWidget {
  const ExamplesSettings({super.key});

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
                    child: Text("Examples",  style: TextStyle(
                                            fontFamily: "roboto" , 
                                            fontSize: 16 , 
                                            fontWeight: FontWeight.w700 , 
                                              color: Color.fromARGB(255, 59, 59, 59),
                              ) ,),
                  ),
                  GestureDetector(
                    onTap: (){
                      word.addExample() ; 
                    },
                    child: const Text( "Add example ", 
                           style: TextStyle(decoration: TextDecoration.underline ,
                               decorationColor:  Color.fromARGB(200, 3, 3, 3) , 
                               decorationThickness: 1.0, 
                           color: Color.fromARGB(200, 3, 3, 3) , ) ),
                  ) ,
                ],
              ),
            ),
            Column(
              children: List.generate(word.examplesControllers.length ,  (index){
                return Padding(
                  padding: const EdgeInsets.only( bottom: 16  , left: 16, right : 16 ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      
                      Column(
                        children: [
                          WordDetailsTextField(text: "example", controller: word.examplesControllers[index] , maxLine: true,),
                           WordDetailsTextField(text: "examaple translation", controller: word.examplesTranslationControllers[index] , maxLine: true,) 
                        ],
                      ) ,
                       Padding(
                        padding: const EdgeInsets.only(top : 8.0),
                        child: GestureDetector(
                          onTap: () {
                            word.deleteExample(index) ;
                          },
                          child: const Icon(Icons.delete_outline_rounded , 
                          color: Color.fromARGB(255, 59, 59, 59),),
                        ),
                      ) ,   
                    ],
                  ),
                ) ; 
              }),
            )
          ],
        ),
      ),
    );
  }
}