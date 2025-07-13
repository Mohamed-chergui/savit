import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/wods_provider_logic/words.dart';

class WordCard extends StatefulWidget {
  final int index ; 
  final String text ;
  const WordCard({super.key , required this.index , required this.text , required });
  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {

  @override
  Widget build(BuildContext context) {
    final words  = Provider.of<WordsProvider>(context , listen : true )  ; 
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Slidable(
          key  : widget.key , 
           startActionPane: !words.isSelectMany && !words.showOnlyPinned ?  ActionPane(
            motion: const StretchMotion() , 
           children: [
            SlidableAction(
              flex: 1 , 
              onPressed: (onPressed){
               words.togglePin("Fruits" , widget.index) ;  
            } ,
            icon: Icons.push_pin_rounded  ,
            foregroundColor: Colors.white,
             backgroundColor: const Color.fromARGB(255 ,167,193,168), 
                    ) , ])  : null ,
          endActionPane:  !words.isSelectMany  && !words.showOnlyPinned ?   ActionPane(
            motion: const StretchMotion() , 
           children: [
            SlidableAction(
              flex: 1,
              onPressed: (onPressed){
              words.deleteWord("Fruits", widget.index) ; 
            } ,
            icon: Icons.delete , 
            backgroundColor: Colors.red, 
          ) , 
           
           ])  : null ,  
        
          child: Stack(
            children: [
                GestureDetector(
                  onTap: () {
                    if (words.isSelectMany){
                      words.settingSelectedWordTodelete(widget.index,!words.selectedWordTodelete[widget.index] ) ; 
                   if (words.selectedWordTodelete[widget.index] ){
                      words.addTodeletedWordsList(widget.index); 
                    }
                    else{
                    words.deleteFromdeletedWordsList(widget.index); 
                    }
                    } 
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                        AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return SizeTransition(
                            sizeFactor: animation,
                            axis: Axis.horizontal,
                            child: child,
                          );
                        },
                        child: words.isSelectMany
                            ? Container(
                                width: 53,
                                height: 33,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: words.typeColorFor(words.typename(widget.index)),
                                    width: 2,
                                  ),
                                ),
                                child: AnimatedOpacity(
                                  opacity: words.selectedWordTodelete[widget.index] ? 1 : 0,
                                  duration: const Duration(milliseconds: 200),
                                  child: const Icon(Icons.check_rounded),
                                ),
                              )
                            : const SizedBox(
                                width: 0,
                                height: 32,
                              ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () { 
                          context.push("/wordPage") ; 
                        },
                      
                          child: Container(
                          decoration:  BoxDecoration(
                            color: const Color.fromARGB(255, 246, 246, 246),
                            borderRadius:  words.isSelectMany ? const BorderRadius.all(Radius.circular(12)) : null 
                          ),
                              
                          child:   Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.text ,
                                    style: const TextStyle(
                                      fontFamily: "roboto" , 
                                      fontSize: 18 ,
                                      fontWeight: FontWeight.w700,
                                      color : Color.fromARGB(255, 59, 59, 59),
                                    )), Text(words.wordPerCollections[0]['words'][widget.index]['description'] ,
                                    style: const TextStyle(
                                      fontFamily: "roboto" , 
                                      fontSize: 15 ,
                                      fontWeight: FontWeight.w600,
                                      color : Color.fromARGB(255, 59, 59, 59),
                                    )),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 24.0),
                                      child:  words.showWordsType ?  Row(
                                        children: [
                                          Container(  decoration:  BoxDecoration(
                                            color: words.typeColorFor(words.typename(widget.index)), 
                                            borderRadius: const BorderRadius.all(Radius.circular(12))
                                          ),
                                          child:  Padding(
                                            padding: const EdgeInsets.only(left: 12.0 , right: 12),
                                            child: Text( words.typename(widget.index), 
                                            style: const TextStyle(
                                              fontFamily: "roboto" , 
                                              fontSize: 14 , 
                                              fontWeight: FontWeight.w600 , 
                                            ),),
                                          ),),
                                           Padding(
                                             padding: const EdgeInsets.only(left : 3.0),
                                             child: Container(  decoration: const BoxDecoration(
                                              color: Color.fromARGB(255 ,244,233,205,) , 
                                              borderRadius: BorderRadius.all(Radius.circular(12))
                                                                       ),
                                                                       child: const Padding(
                                              padding: EdgeInsets.only(left: 12.0 , right: 12),
                                              child: Text("expert" , 
                                              style: TextStyle(
                                                fontFamily: "roboto" , 
                                                fontSize: 14 , 
                                                fontWeight: FontWeight.w600 , 
                                              ),),
                                                                       ),),
                                           ),
                                        ],
                                      ) : const SizedBox.shrink(),
                                    ) , 
                                   
                                    
                                  ],
                                ) 
                              ],
                            ),
                          ) , ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 12, top: 6,
                  child: AnimatedOpacity(
                    opacity: words.wordPerCollections[0]['words'][widget.index]['pinned'] ? 1 : 0  ,
                    duration: const Duration(milliseconds: 500),
                    child: Image.asset("Assets/firstcolor/pin.png"  ,height: 18, )))
              ],
          ) ,
        ),
      ),
    );
  }
}