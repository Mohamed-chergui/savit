import 'package:flutter/material.dart';

class SynonymesPage extends StatelessWidget {
  const SynonymesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16 , right: 8 , left: 8),
      child: Container(
          decoration:  BoxDecoration(
          color:  const Color.fromARGB(255, 248, 248, 248),
          borderRadius: BorderRadius.circular(24),  
          ) ,
          child:  Padding(
             padding: const EdgeInsets.only(left : 20.0 , top : 24 , right: 18 , ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                        const Text('Dictionary'  , 
                            style: TextStyle(
                                          fontFamily: "roboto" , 
                                          fontSize: 20 , 
                                          fontWeight: FontWeight.w700 , 
                                            color: Color.fromARGB(255, 59, 59, 59),
                            ) ,) , 
                            InkWell(
                              onTap: () {
                                
                              },
                              focusColor: Colors.transparent  ,
                              splashColor: Colors.transparent ,
                              child: Container(
                                decoration:  BoxDecoration(
                                  color: const Color.fromARGB(255 ,244,233,205,) ,  
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10 , 4 , 12 , 4  ),
                                  child: Row(
                                    children: [
                                      Image.asset("Assets/firstcolor/linking.png" , height: 16,  width: 16),
                                      const SizedBox(width: 6,),
                                      const Text('linked words'  , 
                              style: TextStyle(
                                            fontFamily: "roboto" , 
                                            fontSize: 14 , 
                                            fontWeight: FontWeight.w700 , 
                                              color: Color.fromARGB(255, 59, 59, 59),
                              ) ,) ,
                                    ],
                                  ),
                                ),
                              ),
                            )
                     ],
                   ) , 
                    const Padding(
              padding: EdgeInsets.fromLTRB(4, 12, 4, 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
            'base form: subordinate, '
            'third person singular: subordinates, '
            'past tense: subordinated, '
            // 'past participle: subordinated, '
            // 'present participle: subordinating, '
            // 'noun form: subordinate, '
            // 'adjective form: subordinate, '
            // 'adverb form: subordinately',
            ,
            style: TextStyle(
              fontFamily: "roboto",
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 76, 76, 76),
            ),
            softWrap: true,
                    ),
                  ),
                ],
              ),
            ) , 
                  Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 12.0 , vertical: 12),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black26 , 
                    ),
                    height: 0.6,
                    width: double.infinity,
                  ),
                ) ,
            const Padding(
              padding: EdgeInsets.only(top :4.0),
              child: Text('Synonyms'  , 
                                style: TextStyle(
                                              fontFamily: "roboto" , 
                                              fontSize: 18 , 
                                              fontWeight: FontWeight.w700 , 
                                                color: Color.fromARGB(255, 59, 59, 59),
                                ) , 
                          ),
            ),
                                            const Padding(
              padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text( "Inferior , Junior, Lower-ranking",
            style: TextStyle(
              fontFamily: "roboto",
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 76, 76, 76),
            ),
            softWrap: true,
                    ),
                  ),
                ],
              ),
            ) , 


            const Padding(
              padding: EdgeInsets.only(top :4.0),
              child: Text('Antonyms'  , 
                                style: TextStyle(
                                              fontFamily: "roboto" , 
                                              fontSize: 18 , 
                                              fontWeight: FontWeight.w700 , 
                                                color: Color.fromARGB(255, 59, 59, 59),
                                ) , 
                          ),
            ),
                                            const Padding(
              padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text( "Superior , Dominant , Chief " , 
            style: TextStyle(
              fontFamily: "roboto",
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 76, 76, 76),
            ),
            softWrap: true,
                    ),
                  ),
                ],
              ),
            ) ,

            const SizedBox(height: 14,) 
              ],
            ),
          ), 
      ),
    ) ; 
  }
}