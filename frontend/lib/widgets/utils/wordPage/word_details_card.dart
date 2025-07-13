import 'package:flutter/material.dart';

class WordDetailsCard extends StatelessWidget {
  const WordDetailsCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24 , right: 8 , left: 8),
      child: Container(
        decoration:  BoxDecoration(
        color:  const Color.fromARGB(255, 248, 248, 248),
        borderRadius: BorderRadius.circular(24),  
        ),
        child:   Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 

              const Padding(
                padding: EdgeInsets.only(top: 8.0 ,left : 6 , right : 6 , bottom: 8),
                child: WordCardAppBar(),
              ), 




              const Padding(
                padding: EdgeInsets.only(top : 12.0),
                child: Center(
                  child: Text('subordinate'  , 
                    style: TextStyle(
                                  fontFamily: "roboto" , 
                                  fontSize: 26 , 
                                  fontWeight: FontWeight.w700 , 
                                   
                                     color: Color.fromARGB(255, 59, 59, 59),
                    ) ,),
                ),
              ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('['  , 
                      style: TextStyle(
                                    fontFamily: "roboto" , 
                                    fontSize: 16 , 
                                    fontWeight: FontWeight.w600 , 
                                     
                                       color: Color.fromARGB(255, 59, 59, 59),
                      ) ,),
                      Text("se'bo:dine"  , 
                      style: TextStyle(
                                    fontFamily: "roboto" , 
                                    fontSize: 16 , 
                                    fontWeight: FontWeight.w600 , 
                                     
                                       color: Color.fromARGB(255, 59, 59, 59),
                      ) ,),
                      Text(']'  , 
                      style: TextStyle(
                                    fontFamily: "roboto" , 
                                    fontSize: 16 , 
                                    fontWeight: FontWeight.w600 , 
                                      color: Color.fromARGB(255, 59, 59, 59),
                      ) ,),
                    ],
                  ),
                ),

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
                  padding: EdgeInsets.symmetric(vertical: 6.0 , horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Definition'  , 
                      style: TextStyle(
                                    fontFamily: "roboto" , 
                                    fontSize: 18 , 
                                    fontWeight: FontWeight.w700 , 
                                      color: Color.fromARGB(255, 59, 59, 59),
                      ) ,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.0),
                        child: Text('shit was not that sjgbjsd gdsg dsg dshjg sd g jdshfbd fd jkfbsqhjf . '  , 
                        style: TextStyle(
                                      fontFamily: "roboto" , 
                                      fontSize: 15 , 
                                      fontWeight: FontWeight.w600 , 
                                        color: Color.fromARGB(255, 59, 59, 59),
                        ) ,),
                      ),
                    ],
                  ),
                )
          
            ],
          ),
        ),
      ),
    ) ; 
  }
}

class WordCardAppBar extends StatelessWidget {
  const WordCardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                color: Colors.green , 
                width: 0.7
                ) ,
                borderRadius: BorderRadius.circular(6) , 
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0 , vertical: 2),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle , 
                        color: Colors.green , 
                      ),
                      height: 6,
                      width: 6,
                    ) , 
                    const Text(' New '  , 
                style: TextStyle(
                              fontFamily: "roboto" , 
                              fontSize: 14 , 
                              fontWeight: FontWeight.w700 , 
                               
                                 color: Colors.green
                ) ,),
                
                  ],
                ),
              ),
                
            ),

             Padding(
                            padding: const EdgeInsets.only(left : 8.0),
                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(6) , 
                                                  color: const Color.fromARGB(255 ,189,231,255,)
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 4.0 , vertical: 2.5),
                                                  child: Text(' adjective '  , 
                                    style: TextStyle(
                                                              fontFamily: "roboto" , 
                                                              fontSize: 14 , 
                                                              fontWeight: FontWeight.w600 , 
                                                               
                             color: Color.fromARGB(255, 59, 59, 59),
                                    ) ,),
                                                ),
                            
                                              ),
                          )
          ],
        ), 

        Padding(
          padding: const EdgeInsets.only(right :6.0),
          child: Image.asset("Assets/secondcolor/speaker.png" , width: 20,),
        )
    
    
                         
      ],
    );
  }
}