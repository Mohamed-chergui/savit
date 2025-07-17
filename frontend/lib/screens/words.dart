import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/collections.dart';
import 'package:wordsapp/Providers/wods_provider_logic/words.dart';
import 'package:wordsapp/widgets/words/edit_word_list.dart';
import 'package:wordsapp/widgets/words/search_info_bar.dart';
import 'package:wordsapp/widgets/words/word_card.dart';

class Words extends StatefulWidget {
  const Words({super.key});

  @override
  State<Words> createState() => _WordsState();
}

class _WordsState extends State<Words> {



// this just to assign the list to all false at the beginnig 
  static bool isPlayed = false ; 
 @override
  void didChangeDependencies() {  
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    final words = Provider.of<WordsProvider>(context, listen: false);
    if (!isPlayed) words.settingSelectedWordTodeleteToFalse();
    isPlayed = true  ; 
  });
  }
  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    final words  = Provider.of<WordsProvider>(context , listen : true ) ; 
    final collections = Provider.of<Collection>(context , listen : true ) ; 
    return  GestureDetector(
      onTap: () =>
        bodyClickHandle(collections, words) ,  
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
      title: const Text('Easy To confuse'  , 
      style: TextStyle(
                    fontFamily: "roboto" , 
                    fontSize: 20 , 
                    fontWeight: FontWeight.w700 , 
                     
                       color: Color.fromARGB(255, 59, 59, 59),
      ) ,),
      actions: const [
       Padding(
         padding: EdgeInsets.only( right : 15.0 , top: 4),
         child: EditWordList() , 
       )
      ],
      centerTitle: true,
      backgroundColor:  const Color.fromARGB(255, 250, 250, 250),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded , color: Color.fromARGB(255, 59, 59, 59) ,),
        onPressed: () {
         context.pop() ; 
        },
      ),
      
        ),
      
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8 , vertical: 18),
      child: Column(
        children: [ 
         words.showSearchBar ?    const SearchandInfoBar() : const SizedBox.shrink() ,
        Padding(
         padding:  words.isSelectMany ?const EdgeInsets.only(bottom : 12.0 , right: 8) : const EdgeInsets.only(bottom : 12.0 , ) ,
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween , 
          children: [
             InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () {
                handleClickAscendingAlphabet(words);  
              },
              child:  Padding(
                padding: const EdgeInsets.only(left : 8.0),
                child: AscendingAlphabetButton(words: words),
              ),
            ) , 
            InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () {
                handleClickSelectMany(words, collections);  
              },
              child:  SelectManyButton(words: words),
            ) ,
         
             ],),
       ) , 
      
      Expanded(
        child: ReordableList(words: words),
      ),
      Consumer<WordsProvider>(
        builder: (context, provider, child) {
          return
         AnimatedSlide( offset: words.isSelectMany ?  const Offset(0, -0.5)  : const Offset(0,3.5), duration: const Duration(milliseconds: 200) , child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                      ElevatedButton(onPressed: (){
                    words.deleteManyWordsByindex();
                    collections.setAddFolder(false);
                      }, 
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(145,43),
                  backgroundColor: Colors.red  ,
                  foregroundColor: Colors.white, 
                  elevation: 0, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24), 
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          
          child:  Text(provider.deletedwordslength())) ,
               
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(145,43),
                backgroundColor: const Color.fromARGB(255, 129, 154, 145),
                foregroundColor: Colors.white, 
                elevation: 0, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24), 
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: const Text("Pin words"),
            ) ,
        ],),) ; 
        }
      )
        ],
      )
        ),
      ),
    );
  }

  void handleClickSelectMany(WordsProvider words, Collection collections) {
    words.assignisSelectMany(!words.isSelectMany) ;
    collections.setAddFolder(!collections.isAddFolder); 
    words.cleardeltedwords() ; 
     words.settingSelectedWordTodeleteToFalse() ; 
  }
  void handleClickAscendingAlphabet(WordsProvider words,) {
    words.assignAscendingAlphabet(!words.ascendingAlphabet); 
    words.handleSettingsChanges(); 
  }

  void bodyClickHandle(Collection collections, WordsProvider words) {
    collections.setAddFolder(false);
    words.assignisSelectMany(false); 
    words.cleardeltedwords() ; 
    words.settingSelectedWordTodeleteToFalse() ; 
  }
}

class SelectManyButton extends StatelessWidget {
  const SelectManyButton({
    super.key,
    required this.words , 
  });
  final WordsProvider words;

  @override
  Widget build(BuildContext context) {
    return  !words.showOnlyPinned ? Text( !words.isSelectMany  ? "Select many " : "Cancel"  , 
       style: const TextStyle(decoration: TextDecoration.underline ,
           decorationColor:  Color.fromARGB(200, 3, 3, 3) , 
           decorationThickness: 1.0, 
       color: Color.fromARGB(200, 3, 3, 3) , ),
        ) : const SizedBox.shrink() ;
  }
}


class AscendingAlphabetButton extends StatelessWidget {
  const AscendingAlphabetButton({
    super.key,
    required this.words , 
  });
  final WordsProvider words;

  @override
  Widget build(BuildContext context) {
    return   Text( !words.ascendingAlphabet ? "Ascending " : "Descending"  , 
       style:  const TextStyle(  
        fontFamily: 'roboto',
       color: Color.fromARGB(200, 3, 3, 3) , ),
        );
  }
}


class ReordableList extends StatelessWidget {
  const ReordableList({
    super.key,
    required this.words,
  });

  final WordsProvider words;

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      onReorder: (oldIndex, newIndex) {
        words.reorderWords("Fruits", oldIndex, newIndex);
      },
      itemCount: words.wordPerCollections[0]['words'].length,
      itemBuilder: (context, index) {
        final word =  words.wordPerCollections[0]['words'][index];
        final isPinned = word['pinned'];
          
        final card = WordCard(
          index: index,
          text: word["name"],
        );
          
        return isPinned 
            ? Container(
                key: ValueKey(index),
                child: card,
              )
            : ReorderableDelayedDragStartListener(
                index: index,
                key: ValueKey(index),
                child: card,
              );
      },
    );
  }
}