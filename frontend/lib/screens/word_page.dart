import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/word_provider.dart';
import 'package:wordsapp/screens/edit_word_page.dart';
import 'package:wordsapp/widgets/utils/wordPage/examples_card.dart';
import 'package:wordsapp/widgets/utils/wordPage/synonymes_page.dart';
import 'package:wordsapp/widgets/utils/wordPage/word_details_card.dart';
import 'package:wordsapp/widgets/utils/wordPage/word_more_info.dart';

class WordPage extends StatefulWidget {
  const WordPage({super.key});

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {

  @override
  Widget build(BuildContext context) {
    final word = Provider.of<WordProvider>(context);
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
       appBar: AppBar(
      backgroundColor:  const Color.fromARGB(255, 250, 250, 250),
      title: const Text('Easy To confuse'  , 
      style: TextStyle(
                    fontFamily: "roboto" , 
                    fontSize: 20 , 
                    fontWeight: FontWeight.w700 , 
                     
                       color: Color.fromARGB(255, 59, 59, 59),
      ) ,),
      leading: IconButton(
        icon: !word.isEditing ?   const Icon(Icons.arrow_back_ios_new_rounded , color: Color.fromARGB(255, 59, 59, 59) ,) :  const Icon(Icons.close , color: Color.fromARGB(255, 59, 59, 59), size: 28,) ,
        onPressed: () {
          if (word.isEditing){
            word.toggleEditingMode() ; 
            return  ; 
          }
         context.pop() ; 
        },      
      ),
      actions:  [
       GestureDetector(
        onTap: () {
          word.toggleEditingMode() ; 
        },
        child:!word.isEditing ?  Padding(
         padding: const EdgeInsets.only( right : 15.0 , top: 4),
          child: Image.asset("Assets/firstcolor/pencil.png" ,height: 23,),
        ) : const Padding(
           padding: EdgeInsets.only( right : 15.0 , top: 4),
          child: Icon(Icons.check , size: 30,),
        ))
      ],
        ),
      body:   AnimatedSwitcher(
        duration:  const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          final offsetAnimation = Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ));
          return SlideTransition(position: offsetAnimation, child: child);
        },
        child:  !word.isEditing ?  const WordPageView() : const EditWordPage())   ,
    );
  }
}

class WordPageView extends StatelessWidget {
  const WordPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: 
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Center(child: WordDetailsCard()) , 
          Center(child: ExamplesCard()) , 
          Center(child: SynonymesPage()) , 
          Center(child: WordMoreInfo()) , 
          SizedBox(height: 40,)
        ],
        
      ),
    ));
  }
}