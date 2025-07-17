import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/collections.dart';

class ColorCard extends StatelessWidget {
 final  Color cardColor ;
 final int index ;  
 const  ColorCard({super.key , required this.cardColor  ,  required this.index });
  @override
  Widget build(BuildContext context) {
    final collections = Provider.of<Collection>(context , listen : false ) ; 
    return Padding(
      padding: const EdgeInsets.only(left : 8.0),
      child: Container(
        decoration:  BoxDecoration(
          shape: BoxShape.circle , 
          color: cardColor , 
          border: Border.all(color: const Color.fromARGB(255, 190, 190, 190) , width: 0.5)
        ),
        height: collections.colorPickedIndex == index ?  50 : 43,
        width:collections.colorPickedIndex == index ?  50 : 43 ,
        child: AnimatedOpacity  (opacity: collections.colorPickedIndex == index ? 1 : 0  , duration: const Duration(milliseconds: 200),
         child: 
         Padding(
           padding: const EdgeInsets.only(right : 10.0 ,bottom: 6 ),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Container(
                 decoration :
                 BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all( color:  const Color.fromARGB(255, 53, 53, 53))),
                  height: 20,
                  width: 20 ,  
                  child: const Center(child: Padding(
                    padding: EdgeInsets.all(.0),
                    child: Center(child: Icon(Icons.check , color: Color.fromARGB(255, 53, 53, 53), size: 16,) ),
                  )),
               )
             ],
           ),
         )
           ),  
      ),
    );
    
  }
}