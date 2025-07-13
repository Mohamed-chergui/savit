import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/word_provider.dart';
import 'package:wordsapp/widgets/utils/wordPage/examples_card_widget.dart';

class ExamplesCard extends StatelessWidget {
  const ExamplesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final wordProvider = Provider.of<WordProvider>(context,) ; 
    return Padding(
      padding:  const EdgeInsets.fromLTRB(8, 12 , 8, 0  ),
      child: Container(
      decoration:  BoxDecoration(
          color:  const Color.fromARGB(255, 248, 248, 248),
          borderRadius: BorderRadius.circular(24),  
          ),
          child:  Padding(
            padding: const EdgeInsets.only(left : 20.0 , top : 16 , right: 18 , ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 18.0),
                  child: Row(
                    children: [
                      Text('Examples'  , 
                          style: TextStyle(
                                        fontFamily: "roboto" , 
                                        fontSize: 18 , 
                                        fontWeight: FontWeight.w700 , 
                                          color: Color.fromARGB(255, 59, 59, 59),
                          ) ,),
                    ],
                  ),
                ) , 
                          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            for (int i = 0; i < wordProvider.wordExamples.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(left : 4.0   , right: 8 , bottom: 24 ) ,
                              child: ExpandableAnimatedCard(
                              text: wordProvider.wordExamples[i],
                              textStyle: const TextStyle(
                              fontFamily: "roboto",
                              fontSize: 15,
                              color: Color.fromARGB(255, 59, 59, 59),
                                                        ),
                                                      ),
                            )
                          ],
                        ) , 

              ],
            ),
          ),
      ) ,
    );
  }
}