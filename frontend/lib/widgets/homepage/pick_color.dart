import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/collections.dart';
import 'package:wordsapp/widgets/utils/color_card.dart';


class PickColor extends StatefulWidget {
  const PickColor({super.key});

  @override
  State<PickColor> createState() => _PickColorState();
}

class _PickColorState extends State<PickColor> {
  @override
  Widget build(BuildContext context) {
  final collections = Provider.of<Collection>(context ,  ) ; 
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: collections.allFolderColors.length ,
        itemBuilder: (context, index) {
           return Row(
          children: [
           GestureDetector
           (
            onTap: () {
              collections.colorindexchange(index) ; 
            },
            
            child: ColorCard(cardColor: collections.allFolderColors[index], index: index,))
        ],) ; 
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}


