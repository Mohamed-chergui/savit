import 'package:flutter/material.dart';
import 'package:wordsapp/widgets/homepage/appbar.dart';
import 'package:wordsapp/widgets/homepage/collections.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Appbar(),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Collections(),
                        SizedBox(height: 60),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        

             
          ],
        ),
      ),
    );
  }
}