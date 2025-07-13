import 'package:flutter/material.dart';

class WordsContainer extends StatefulWidget {
  const WordsContainer({super.key});

  @override
  State<WordsContainer> createState() => _WordsContainerState();
}

class _WordsContainerState extends State<WordsContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 10,
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.amberAccent, 
            
          ),
        ),
      );
        },
      ),
    );
  }
}