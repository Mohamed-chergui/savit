import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier{



// Main Color of the app 
List <Color> mainColorOptions = [const Color.fromARGB(255 ,222,213,246,) , const Color.fromARGB(255 ,189,231,255,), const Color.fromARGB(255 ,191,174,163), const Color.fromARGB(255 ,250,204,181,),const Color.fromARGB(255 ,244,233,205,),const Color.fromARGB(255 ,167,193,168),const Color.fromARGB(255, 167, 189, 193),const Color.fromARGB(255, 219, 131, 120),const Color.fromARGB(255, 193, 167, 186) ] ;  
int mainColorindex = 0 ; 
void setMainColorIndex ( int index ){
mainColorindex = index;
notifyListeners() ;
}



bool isReversed = false  ; 
bool isDarkMode  = true  ;  

void setIsDarkMode ( bool value  ){
isDarkMode = value ; 
notifyListeners() ; 
}
void setIsReversed ( bool value ){
isReversed = value; 
notifyListeners() ; 
}


/// Apps Theme
Color backgroundColor(){
if (isDarkMode  ) return  const Color.fromARGB(255, 20,19,23) ; 
return const Color.fromARGB(255, 255, 255, 255) ; 
}


   Color iconColor (){
  if(isDarkMode) return  const Color.fromARGB(255, 250, 250, 250) ; 
 return  const Color.fromARGB(255, 37, 37, 37) ; 

   }

Color textColor(){
  if(isDarkMode) return  const Color.fromARGB(255, 233, 233, 233) ; 
 return  const Color.fromARGB(255, 37, 37, 37) ; 
}

Color cardColor () {
  if (isDarkMode) return const Color.fromARGB(255, 31,31,33) ; 
return  const Color.fromARGB(255, 246, 246, 246);
}

Color appBarColor (){
if (  isDarkMode) return const Color.fromARGB(255, 20,19,23 )   ; 
return const Color.fromARGB(255, 250, 250, 250 ) ; 
}






}