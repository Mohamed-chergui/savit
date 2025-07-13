import 'package:flutter/material.dart';

class DropDownForSettings extends StatelessWidget {

  final String text  ;  
  const DropDownForSettings({
    super.key,
     required this.types,
     this.text = "Gender" , 
  });

  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: const Color.fromARGB(255, 240, 240, 240),
      ),
      child: DropdownButtonFormField<String>(
        decoration:  InputDecoration(
          labelText: text,
           labelStyle: const TextStyle(
              fontSize: 15 , 
              fontFamily: "roboto",  
            ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 138, 138, 138),
              width: 1.5,
            ),
          ),
        ),
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontFamily: "roboto",
          fontWeight: FontWeight.w500,
        ),
        value: types.isNotEmpty ? types.first : null,
        onChanged: (String? newValue) {
        },
        items: types.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            
            value: value,
            child: Text(value),
          );
          
        }).toList(),
      ),
    );
  }
}