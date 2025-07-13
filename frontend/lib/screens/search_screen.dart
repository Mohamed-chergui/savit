import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.only(top : 12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 43,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 244, 244, 244),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:  TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top : 6),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          fontFamily: "roboto", 
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 138, 138, 138),
                           ),
                  border: InputBorder.none, 
                        enabledBorder: InputBorder.none, 
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                  color: Color.fromARGB(255, 183, 183, 183),
                  width: 0.3
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 8.0 , top: 10 , bottom: 10),
                          child: Image.asset("Assets/firstcolor/search-3.png" , height: 12,),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
             const Expanded(child: Center(child: Text("search in your folders and words . " , style: TextStyle(
              fontFamily: "roboto"
             ),))) , 
          ],

        ),
      )),
    );
  }
}