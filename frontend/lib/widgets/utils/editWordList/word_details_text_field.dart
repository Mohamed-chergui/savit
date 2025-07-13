import 'package:flutter/material.dart';

class WordDetailsTextField extends StatelessWidget {

  final String text  ; 
   final TextEditingController controller ;  
   final  bool maxLine ; 
   final int  ?  maxLength ;  
   final IconData? icon;
   const WordDetailsTextField({
    super.key,
    required this.text , 
    required this.controller ,
    required this .maxLine  ,  
    this.maxLength , 
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return  TextField(
      maxLines:  maxLine  ? null : 1 ,
      maxLength: maxLength,
      
      controller: controller,
       style: const TextStyle(
          color: Colors.black,        
          fontSize: 15,  
          fontFamily: "roboto",             
          fontWeight: FontWeight.w500,),    
        decoration: InputDecoration(
          suffixIcon: icon != null
          ? Icon(icon, size: 20, color: Colors.grey)
                : null,
          labelText: text,
          border: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
          color: Colors.grey,
            width: 0.5,
              ),
            ),
            labelStyle: const TextStyle(
              fontSize: 17 , 
              fontFamily: "roboto",  
            ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:  Color.fromARGB(255, 129, 154, 145) ,
                              width: 1.5,
                            ),
        ),
                                      ),
                                      ) ; 
  }
}