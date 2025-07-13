
import 'package:flutter/material.dart';

class WordProvider with ChangeNotifier {


List<String> wordExamples   = ["shit was lit fhsjf sjf jsd fd sj fjds f chjsbchj sd  cdsj c hcjs subordanate .  " , "i dont give a shit " , "bahae is cool " ] ; 
// settings of the word page 
 bool isEditing = false  ; 
 bool  hideWordsForm = false ; 
 bool  hideWordSynonyms = false ; 
 bool  hideWordAntonyms = false ; 

 void toggleEditingMode ( ){
  isEditing = !isEditing ; 
  notifyListeners() ; 
 }





List <String> wordFormsTextFieldsOptions  = [ "third person singular", "past tense","past participle", "present participle", "noun form" , "adjective form", "adverb form"] ; 
String baseForm = "nothing like that" ;
List<String> addedForms = ["base form"] ; 
List<TextEditingController> examplesControllers= [TextEditingController(text: "")] ; 
List<TextEditingController> examplesTranslationControllers= [TextEditingController(text: "")] ; 
List<TextEditingController> synonymesControllers = [TextEditingController(text: "")] ;
List<TextEditingController> antonymsControllers = [TextEditingController(text: "")] ;
List<TextEditingController> tagsControllers = [TextEditingController(text: "")] ;


void setWordForms (){
}



void addExample  ( ) {
examplesControllers.add( TextEditingController(text: "")) ; 
examplesTranslationControllers.add( TextEditingController(text: "")) ;
notifyListeners() ;  
}

 void  deleteExample (int index ){
if  ( examplesControllers.length == 1 ) return  ; 
examplesControllers.removeAt(index) ; 
examplesTranslationControllers.removeAt(index) ; 
notifyListeners() ; 
 }

 void addSynonyme(){
synonymesControllers.add( TextEditingController(text: "")) ; 
notifyListeners() ; 
 }


 void addAntonyme(){
antonymsControllers.add( TextEditingController(text: "")) ; 
notifyListeners() ; 
 }

 void addTags(){
  if ( tagsControllers.length >= 2 ) return  ; 
tagsControllers.add( TextEditingController(text: "")) ; 
notifyListeners() ; 
 }


 void deleteSynonyme (int index ){
  if  ( synonymesControllers.length == 1 ) return  ; 
  synonymesControllers.removeAt(index) ;
  notifyListeners() ; 
 }

 void deleteAntonym (int index ){
  if  ( antonymsControllers.length == 1 ) return  ; 
  antonymsControllers.removeAt(index) ;
  notifyListeners() ; 
 }

void deleteTag (int index ){
  if  ( tagsControllers.length == 1 ) return  ; 
  tagsControllers.removeAt(index) ;
  notifyListeners() ;
}








void changeWordForm(String? newText , String oldText){
  if ( newText == null  ) return ; 
wordFormsTextFieldsOptions.removeWhere((test) => test == newText) ; // delete from  
addedForms.removeWhere((test) => test == oldText) ; // delete from  
addedForms.add(newText) ; 
wordFormsTextFieldsOptions.add(oldText) ; 
notifyListeners() ; 
}

void addWordForms(){
  if(wordFormsTextFieldsOptions.isEmpty ) return ; 
   String wordform = wordFormsTextFieldsOptions[0] ; 
   wordFormsTextFieldsOptions.removeAt(0) ; 
   addedForms.add(wordform); 
   notifyListeners() ; 
}

void setHideWordForms() {
  hideWordsForm = !hideWordsForm ; 
  notifyListeners() ; 
}
void setHideSynonymes() {
  hideWordSynonyms= !hideWordSynonyms; 
  notifyListeners() ; 
}
void setHideAnotyms() {
  hideWordAntonyms= !hideWordAntonyms; 
  notifyListeners() ; 
}
}






