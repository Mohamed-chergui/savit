
import 'package:flutter/material.dart';
import 'package:wordsapp/Providers/wods_provider_logic/wordsLogic.dart';








class WordsProvider extends  ChangeNotifier with WordsLogic {

String currentCollection = "Fruits" ; 
 List <Color> allTypesColors = [const Color.fromARGB(255 ,222,213,246,) , const Color.fromARGB(255 ,189,231,255,), const Color.fromARGB(255 ,191,174,163), const Color.fromARGB(255 ,250,204,181,),const Color.fromARGB(255 ,244,233,205,),const Color.fromARGB(255 ,167,193,168)] ; 

// thuis have the indexes words that has been deleted or (pinned)
List <int> deletedWords = [] ; 
List<bool>  selectedWordTodelete = [] ; 


/// this variable controlles selectmany mode
bool isSelectMany = false ; 



/// Edit Words List variables 
bool showOnlyPinned  = false  ; 
bool showWordsType = true  ; 
bool showSearchBar = true  ; 
bool recentlyAdded = false  ; 
bool pinnedWordsIntop = true ; 
bool priorityToWordType = true ; 
bool atoZ = false ;
bool ascendingAlphabet = false  ;  
bool permanentChanges = true  ; 
bool ascendingDateTime = false; 
bool descendingDateTime = false ; 


// temps of the settings variables before save changes 
bool tempshowOnlyPinned  = false  ; 
bool tempshowWordsType = true  ; 
bool tempshowSearchBar = true  ; 
bool temprecentlyAdded = false  ; 
bool temppinnedWordsIntop = true ; 
bool temppriorityToWordType = true ; 
bool tempatoZ = false ;
bool tempascendingDateTime = false; 
bool tempdescendingDateTime = false ;  





 
  

//// this have all the words for each collection s
List<Map<String, dynamic>> wordPerCollections = [
  {
    'collection': 'Fruits',
    'words': [
      {  
        'id': "gggs" ,
        'name' : 'apple' , 
        'description' : "delecoius fruits", 
        'type' : "noun", 
        'pinned' : true , 
      } ,
      {
        'id' : "fsdfdsf" , 
        'name' : 'shit' , 
        'description' : "delecoius fruits" , 
        'type' : "adj" , 
        'pinned' : true , 
      } ,
       {
        'id' : "fsfdsf" , 
        'name' : 'banana' , 
        'description' : "bad fruits" , 
        'type' : "adj" , 
        'pinned' : true , 
      } ,
      {
        'id' : "fsfvksnv" , 
        'name' : 'khra' , 
        'description' : "bad fruits" , 
        'type' : "verb" , 
        'pinned' : false , 
      } ,
        {
        'id' : "azeradsgf" , 
        'name' : 'ananas' , 
        'description' : "meh fruits" , 
        'type' : "adj" , 
        'pinned' : false , 
      } ,
     
      
       ]
  },
];

// this for the show only pinned backup 
List<Map<String, dynamic>> _originalWordsBackup = [];





////// FUNCTIONS

void deleteWord(String collection, int index) {
  final target = wordPerCollections.firstWhere(
    (element) => element['collection'] == collection,
    orElse: () => {},
  );

  if (target.isNotEmpty) {
    final wordList = target['words'] as List;
    if (index >= 0 && index < wordList.length) {
      if (showOnlyPinned){
        _originalWordsBackup.removeWhere((word) => word['id'] == wordList[index]['id']  ); 
      }
      wordList.removeAt(index);
      notifyListeners();
    }
  }
}

void settingSelectedWordTodeleteToFalse (){
final target = wordPerCollections.firstWhere(
    (element) => element['collection'] == currentCollection,
    orElse: () => {},
  );
  selectedWordTodelete = List.filled(target['words'].length , false) ; 
  notifyListeners();
}


void settingSelectedWordTodelete (int index  , bool value ){
    selectedWordTodelete[index] = value   ;
    notifyListeners() ;  
  
}


void deleteManyWordsByindex() {
   deletedWords.sort() ;
   final target = wordPerCollections.firstWhere(
    (element) => element['collection'] == currentCollection,
    orElse: () => {},
  );
    final words = target['words'] as List  ; 
    int index ; 
     for ( int i =  deletedWords.length - 1 ; i >= 0 ; i--){
      index  = deletedWords[i] ;  
      words.removeAt(index); 
  }
  /// clear data before 
  deletedWords =[] ; 
  isSelectMany = false ; 
  notifyListeners() ; 
}



void assignisSelectMany(bool value ){
    isSelectMany = value ; 
    notifyListeners() ;
}

void assignAscendingAlphabet(bool value ){
    ascendingAlphabet = value ; 
    notifyListeners() ;
}



void addTodeletedWordsList (int index){
  deletedWords.add(index) ; 
  notifyListeners() ; 
}

void deleteFromdeletedWordsList (int index){
  deletedWords.remove(index) ; 
  notifyListeners() ; 
}



  // return the type
String typename (int index){
      final target = wordPerCollections.firstWhere(
          (element) => element['collection'] == currentCollection,
          orElse: () => {},
        );
    return  target['words'][index]['type'] ; 
   }



  String deletedwordslength(){
    // UI 
    if ( deletedWords.isEmpty){
      return "Delete all" ; 
    } 
    return " Delete all ${deletedWords.length.toString()}" ;
   }
   void  cleardeltedwords (){
    deletedWords = [] ; 
    notifyListeners() ; 
   }

   bool existsIndeleted(int index){
    if ( deletedWords.contains(index)) return true ; 
    return false ; 
   }





// UI 
 bool handleTypeOfSetting(String typeOfSetting){
    switch(typeOfSetting){
        case ("showOnlyPinned" ) :
         return tempshowOnlyPinned ;  
        case ("showWordsType" ) :
         return tempshowWordsType ;  
        case ("showSearchBar" ) :
         return tempshowSearchBar ;  
        case ("recentlyAdded" ) :
         return temprecentlyAdded ;  
        case ("pinnedWordsIntop" ) :
         return temppinnedWordsIntop ;   
        case ("priorityToWordType" ) :
         return temppriorityToWordType ;  
         case ("atoZ" ) :
         return tempatoZ ;  
        case ("ascendingDateTime" ) :
         return tempascendingDateTime ;  
        case ("descendingDateTime" ) :
         return tempdescendingDateTime ;  
         case ("permanentChanges" ) :
         return permanentChanges ;  
        
      default : 
      return showOnlyPinned  ;
      }
    }

void changeBooleanbSettings( String settingName ,bool value  ){
      switch(settingName){
        case ("showOnlyPinned" ) :
         tempshowOnlyPinned = value  ; 
        case ("showWordsType" ) :
         tempshowWordsType = value  ; 
        case ("showSearchBar" ) :
         tempshowSearchBar= value  ; 
        case ("recentlyAdded" ) :
         temprecentlyAdded = value  ; 
        case ("pinnedWordsIntop" ) :
         temppinnedWordsIntop = value  ; 
        case ("priorityToWordType" ) :
         temppriorityToWordType = value  ;
         if( value ){
          tempatoZ = false ; 
         }
        case ("atoZ" ) :
        tempatoZ = value ; 
         if( value ){
          temppriorityToWordType = false ; 
         }
        case ("ascendingDateTime" ) :
        tempascendingDateTime = value ;  
        tempdescendingDateTime = !value ; 
        case ("descendingDateTime" ) :
         tempdescendingDateTime = value ; 
         tempascendingDateTime = !value ; 
               
      case ("permanentChanges" ) :
      permanentChanges = value  ; 
      default : 
      tempshowOnlyPinned = value  ;  
      }
      notifyListeners() ; 
   }

// this function handle all the logic for reordering and pinned words UI 
void reorderWords(String collection, int oldIndex, int newIndex) {
  // UI 
  if (newIndex > oldIndex) newIndex -= 1;
  final target = wordPerCollections.firstWhere(
    (element) => element['collection'] == collection,
    orElse: () => {},
  );
          final wordList = target['words'] as List;
          // always the pinned on top
  if (  wordList[oldIndex]['pinned'] == true  && wordList[newIndex ]['pinned'] == false && pinnedWordsIntop  || wordList[oldIndex]['pinned'] == false  && wordList[newIndex]['pinned'] == true  && pinnedWordsIntop)  {  
            return;
  }
  if (target.isNotEmpty) {
    final item = wordList.removeAt(oldIndex);
    wordList.insert(newIndex, item);
    notifyListeners();
  }
}

Color typeColorFor(String type) {
  //UI 
  switch (type) {
    case "adj":
      return allTypesColors[1];
    case "verb":
      return allTypesColors[0];
    case "noun":
      return allTypesColors[3];
    default:
      return allTypesColors[0];
  }
}









// WORDS SETTINGS  
  
void togglePin(String collection, int index) {
  final target = wordPerCollections.firstWhere(
    (element) => element['collection'] == collection,
    orElse: () => {},
  );

  if (target.isNotEmpty) {
    final wordList = target['words'] as List ;
    if (index >= 0 && index < wordList.length) {
      wordList[index]['pinned'] = !(wordList[index]['pinned'] as bool);
      orderWordsBasedOnSettings(target , index , atoZ , pinnedWordsIntop , ascendingAlphabet , priorityToWordType) ; 
      notifyListeners();
    }
  }
}

void handlesShowOnlyPinnedWords (){
  final target = wordPerCollections.firstWhere(
    (element) => element['collection'] == currentCollection,
    orElse: () => {},
  );

  final wordsList = target['words'] as List ;
  
  if (_originalWordsBackup.isEmpty) {
    _originalWordsBackup = List.from(target['words']);
  }

  if (showOnlyPinned) { 
    target['words'] = wordsList.where((word) => word['pinned']).toList();
  } else {
    target['words'] = List.from(_originalWordsBackup);
  }
  notifyListeners();
}


void handleSettingsChanges(){

assignTempVariables() ;
handlesShowOnlyPinnedWords() ; 
  if (atoZ){
  sortByAlphabet(wordPerCollections, currentCollection, ascendingAlphabet) ;
  if ( pinnedWordsIntop){
    sortPinnedWordsAtTop(wordPerCollections, currentCollection ) ;  
  } 
  } 
  else if (priorityToWordType){
  sortByWordType(wordPerCollections , currentCollection ,  ascendingAlphabet);
  if ( pinnedWordsIntop){
   sortPinnedWordsAtTop(wordPerCollections, currentCollection ) ;  
  } 
  }
  return ; 
}



void assignTempVariables (){

showOnlyPinned = tempshowOnlyPinned    ; 
showWordsType =  tempshowWordsType    ; 
showSearchBar =  tempshowSearchBar    ; 
recentlyAdded =  temprecentlyAdded   ; 
pinnedWordsIntop = temppinnedWordsIntop   ; 
priorityToWordType = temppriorityToWordType   ; 
atoZ  = tempatoZ  ;
ascendingDateTime = tempascendingDateTime   ; 
descendingDateTime =  tempdescendingDateTime  ;  

}








}

 





