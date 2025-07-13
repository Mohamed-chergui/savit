





mixin  WordsLogic {



// CALL (UN)PIN FUNCITONS
void orderWordsBasedOnSettings(Map<String,dynamic> target , int index , bool atoZ , bool pinnedWordsIntop , bool ascendingAlphabet, bool priorityToWordType    ){
     
      if (target['words'][index]['pinned']){
        // pinning 
        if (atoZ){
        pinAlphabetOrder(target , index , pinnedWordsIntop , ascendingAlphabet  ) ;  
        } else if (priorityToWordType ){
        pinWordsType(target , index , pinnedWordsIntop , ascendingAlphabet  ) ;  
        }
      } 
      else {  
        // unpinnig
        if (atoZ){
        unpinAlphabetOrder(target , index , pinnedWordsIntop , ascendingAlphabet  ) ;  
        } else if (priorityToWordType ){
          unpinWordsType(target , index , pinnedWordsIntop , ascendingAlphabet  ) ;  
        }
        
      } 
}

  // SORTING ALGORITHMS

  void sortPinnedWordsAtTop  (List<Map<String, dynamic>> wordPerCollections , String currentCollection ,  ){ 
    final target = wordPerCollections.firstWhere(
    (element) => element['collection'] == currentCollection,
    orElse: () => {},
  );
   var wordsList = target['words'] as List;
     List pinned = [];
     List nonPinned = [];

  for (var word in wordsList) {
    if (word['pinned'] == true) {
      pinned.add(word);
    } else {
      nonPinned.add(word);
    }
  }
  // combining same as addAll 
  target['words'] = [...pinned, ...nonPinned];
  }

  void sortByWordType  (List<Map<String, dynamic>> wordPerCollections , String currentCollection , bool ascendingAlphabet ){ 
    final target = wordPerCollections.firstWhere(
    (element) => element['collection'] == currentCollection,
    orElse: () => {},
  );
   var wordsList = target['words'] as List;
     List adjectives = [];
     List nouns = [];
     List verbs = [];

  for (var word in wordsList) {
    if (word['type'] == "noun") {
      nouns.add(word);
    } else if (word['type'] == "verb") {
      verbs.add(word);
    } else {
      adjectives.add(word);
    }
  }
  sortAlphabetically(nouns , ascendingAlphabet) ; 
  sortAlphabetically(verbs , ascendingAlphabet) ;  
  sortAlphabetically(adjectives , ascendingAlphabet) ; 

  // combining same as addAll  (in new list)
  target['words'] = [...nouns, ...verbs ,...adjectives];
  }




  void sortAlphabetically(List list , bool ascendingAlphabet ) {
  list.sort((a, b) {
    final aName = a['name'].toString().toLowerCase();
    final bName = b['name'].toString().toLowerCase();
    return ascendingAlphabet ? aName.compareTo(bName) : bName.compareTo(aName);
  });
}


// Usage: _sortAlphabetically(nouns);
  void sortByAlphabet(List<Map<String, dynamic>> wordPerCollections , String currentCollection , bool ascendingAlphabet ) {
  final target = wordPerCollections.firstWhere(
    (element) => element['collection'] == currentCollection,
    orElse: () => {},
  );
   var wordsList = target['words'] as List;
  
    wordsList.sort((a, b) {
    String nameA = a['name'].toString().toLowerCase();
    String nameB = b['name'].toString().toLowerCase();
    return ascendingAlphabet ? nameA.compareTo(nameB) : nameB.compareTo(nameA);
  });
  }


// (UN)PIN LOGIC FUNCTIONS :

void pinAlphabetOrder(Map<String, dynamic> target, int index  , bool pinnedWordsIntop , bool ascendingAlphabet ) {
  if (index < 0 || index >= target['words'].length) return;
  
  int maxLengthOfSearch = target['words'].length;
  
  // find the max length in sorting (pinned at top case)
  if (pinnedWordsIntop) {
    int i = 0;
    while (i < target['words'].length && target['words'][i]['pinned']) {
      i++;
    }
    maxLengthOfSearch = i;
  }

  final item = target['words'].removeAt(index);
  final itemName = item['name'].toString().toLowerCase();
  
  if (pinnedWordsIntop && item['pinned']) {
    maxLengthOfSearch = maxLengthOfSearch - 1; 
  }
  else {
  maxLengthOfSearch = target['words'].length ; 
  } 
  

  for (int i = 0; i < maxLengthOfSearch; i++) {
    final currentName = target['words'][i]['name'].toString().toLowerCase();
    if (ascendingAlphabet) {
      // Ascending order
      if (itemName.compareTo(currentName) < 0) {
        target['words'].insert(i, item);
        return;
      }
    } else {
      // Descending order
      if (itemName.compareTo(currentName) > 0) {
        target['words'].insert(i, item);
        return;
      }
    }
  }
  // If no position matched, add at the end (or at the last of the pinned list )
  if ( pinnedWordsIntop){
    if ( maxLengthOfSearch == target['words'].length  ) {
      // last ellement and has no place
      target['words'].insert( maxLengthOfSearch  , item) ; 
     return ;  
     }
    target['words'].insert( maxLengthOfSearch + 1 , item) ; 
    return ; 
  }

  target['words'].add(item);
}
  
 void unpinAlphabetOrder(Map<String,dynamic> target , int index , bool pinnedWordsIntop, bool ascendingAlphabet ){
 
 if ( pinnedWordsIntop){
   final item = target['words'].removeAt(index);
  final itemName = item['name'].toString().toLowerCase();
  int maxLengthOfSearch = target['words'].length - 1   ; 


 int i = 0 ; 
  while (i < target['words'].length && target['words'][i]['pinned']){
    i++ ; 
  }
  int  firstNonPinnedIndex = i ;

  for(int i = firstNonPinnedIndex  ;  i < maxLengthOfSearch - 1  ; i++   ) {
  final currentName = target['words'][i]['name'].toString().toLowerCase();

  if (ascendingAlphabet) {
      // Ascending order
      if (itemName.compareTo(currentName) < 0) {
        target['words'].insert(i, item);
        return;
      }
    } else {
      // Descending order
      if (itemName.compareTo(currentName) > 0) {
        target['words'].insert(i, item);
        return;
      }
    }
 }
  if ( maxLengthOfSearch == target['words'].length  ) {
      // last ellement and has no place
      target['words'].insert( maxLengthOfSearch  , item) ; 
     return ;  
     }
    target['words'].insert( maxLengthOfSearch + 1  , item) ; 
    return ; 
  } 
  
  else {
    return ; 
  }

 }

void pinWordsType(Map<String, dynamic> target, int index , bool pinnedWordsIntop , bool ascendingAlphabet ) {


  if (index < 0 || index >= target['words'].length) return;
  
  final item = target['words'][index];
  final itemName = item['name'].toString().toLowerCase();
  final wordType = item['type'];
  
  target['words'].removeAt(index);
   int  maxLengthOfSearch = target['words'].length ; 
  
  int startIndex = 0;
  int endIndex = target['words'].length; 

  if (pinnedWordsIntop) {
    int i = 0;
    while (i < target['words'].length && target['words'][i]['pinned']) {
      i++;
    }
    maxLengthOfSearch = i;
  }
  
  // the start of the word type section
  for (int i = 0; i < maxLengthOfSearch ; i++) {
    if (target['words'][i]['type'] == wordType) {
      startIndex = i;
      break;
    }
  }
  
  // the end of the word type section
  for (int i = startIndex; i < maxLengthOfSearch ; i++) {
    if (target['words'][i]['type'] != wordType) {
      endIndex = i;
      break;
    }
  }
  
  // case of no matching add in the appropriate postion 
  if (pinnedWordsIntop){
     if (startIndex == endIndex) {
    target['words'].insert(endIndex , item);
    return;
  }
    } 
  else {
       if (startIndex == endIndex) {
          target['words'].add(item);
          return;
                  }
    }
  
  //searching only within the word type section
  for (int i = startIndex; i < endIndex; i++) {
    final currentName = target['words'][i]['name'].toString().toLowerCase();   
    if (ascendingAlphabet) {
      if (itemName.compareTo(currentName) < 0) {
        target['words'].insert(i, item);
        return;
      }
    } else {
      if (itemName.compareTo(currentName) > 0) {
        target['words'].insert(i, item);
        return;
      }
    }
  }
  
  // If not inserted in the loop, insert at the end of the type section
  target['words'].insert(endIndex, item);
}

void unpinWordsType (Map<String, dynamic> target, int index , bool pinnedWordsIntop , bool ascendingAlphabet){

  if ( pinnedWordsIntop){

    final item = target['words'][index];
  final itemName = item['name'].toString().toLowerCase();
  final wordType = item['type'];
  
  target['words'].removeAt(index);
   int  maxLengthOfSearch = target['words'].length ; 
  
  int startIndex = 0;
  int endIndex = target['words'].length; 

 int i = 0 ; 
  while (i < target['words'].length && target['words'][i]['pinned']){
    i++ ; 
  }
  int firstNonPinnedIndex = i  ; 

  
   // the start of the word type section unpinend
  for (int i = firstNonPinnedIndex ; i < maxLengthOfSearch ; i++) {
    if (target['words'][i]['type'] == wordType) {
      startIndex = i;
      break;
    }
  }
  
  // the end of the word type section unpinned
  for (int i = startIndex; i < maxLengthOfSearch ; i++) {
    if (target['words'][i]['type'] != wordType) {
      endIndex = i;
      break;
    }
  }
    // if case of there is no maching in word type
   if (startIndex == endIndex) {
    target['words'].add(item);
    return;
  }

for (int i = startIndex; i < endIndex; i++) {
    final currentName = target['words'][i]['name'].toString().toLowerCase();   
    if (ascendingAlphabet) {
      if (itemName.compareTo(currentName) < 0) {
        target['words'].insert(i, item);
        return;
      }
    } else {
      if (itemName.compareTo(currentName) > 0) {
        target['words'].insert(i, item);
        return;
      }
    }
  }


 target['words'].insert(endIndex, item);
  }

  else
   { 
    // unpin in case of no word on top 
    return ; 
  }

 }

}

