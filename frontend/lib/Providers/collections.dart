



import 'package:flutter/material.dart';

class Collection extends ChangeNotifier  {
    
    // this a list to keep track 
    // of the itmes that has been animated ( first time ) to not animate them again 
     Map<String,bool> isFirstBuild  =    { 'folder_01' :  true ,'folder_02' :  true ,'folder_03' :  true ,'folder_04' :  true ,  'folder_05' :  true , }  ;


       
      bool isholdFolderMode = false  ; 

      // the selected one is to delete (info)  
      String foldeToDeleteId = "" ;       
      bool choosedDelete = false   ; 

      // in adding folder state 
     bool  isAddFolder = false  ; 



    // this list have all the folders colors 
    List <Color> allFolderColors = [const Color.fromARGB(255 ,222,213,246,) , const Color.fromARGB(255 ,189,231,255,), const Color.fromARGB(255 ,191,174,163), const Color.fromARGB(255 ,250,204,181,),const Color.fromARGB(255 ,244,233,205,),const Color.fromARGB(255 ,167,193,168)] ; 
    int colorPickedIndex = 0  ; 
    String newFolderName = "" ; 


   


 final List<Map<String,dynamic> >  collectionsList = [

{
      'id': 'folder_01',
      'name': "Easy to confuse",
      'color': "blue",
      'total': "300",
      'revised': "32",
      'last': "today",
      "best": false,
    },
    {
      'id': 'folder_02',
      'name': "Not good yet",
      'color': "pink",
      'total': "300",
      'revised': "32",
      'last': "today",
      "best": false,
    },
    {
      'id': 'folder_03',
      'name': "shit",
      'color': "brown",
      'total': "300",
      'revised': "32",
      'last': "today",
      "best": false,
    },
    {
      'id': 'folder_04', 
      'name': "shit",
      'color': "orange",
      'total': "300",
      'revised': "49",
      'last': "today",
      "best": false,
    },
    {
      'id': 'folder_05',
      'name': "Easy to confuse",
      'color': "gold",
      'total': "300",
      'revised': "32",
      'last': "today",
      "best": false,
    },

] ;

void choosedDeletefunc( bool val ){
choosedDelete = val  ; 
notifyListeners() ; 
}



void holdFolderMode ( ){
isholdFolderMode =  !isholdFolderMode ;
notifyListeners() ; 
}

void asignholdFolderMode (bool value  ){
isholdFolderMode =  value ;
notifyListeners() ; 
}



void setAddFolder(bool value) {
    isAddFolder = value;
    notifyListeners();
  }

 void deleteFolder( String id ) {
    collectionsList.removeWhere((folder) => folder['id'] == id);   
   isFirstBuild.remove(id);   // remove also from the animation list 
      notifyListeners();
 }


void colorindexchange ( int index  ){
colorPickedIndex = index  ; 
notifyListeners() ; 
}
void changeNewFolderName ( String name ){
 newFolderName = name ; 
}


/// this function maps the rgb colors ( colorPickedIndex ) to a folder color 
 String mapColorFromRgb  ( int colorPickedIndex  )  {
  switch(colorPickedIndex) {
    case 0 : 
    return "pink" ; 
    case 1 : 
    return "blue" ; 
    case 2 : 
    return "brown" ; 
    case 3 : 
    return "orange" ; 
    case 4 : 
    return "gold" ;
    case 5 : 
    return "green" ;  
    default : 
    return "pink" ; 
  }
 }

  // this the main function that adds one folder
 void addFolder(){
  collectionsList.add({
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'name': newFolderName,
      'color': mapColorFromRgb(colorPickedIndex),
      'total': "0",
      'revised': "0",
      'last': "today",
      "best": false,
  
  }) ; 
  newFolderName = "" ; 
  notifyListeners() ; 

 }




}