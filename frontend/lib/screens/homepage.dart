import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final theme = Theme.of(context);
    return  AnnotatedRegion<SystemUiOverlayStyle>(
       value:  theme.brightness == Brightness.light
        ? SystemUiOverlayStyle.light // white text/icons
        : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: const SafeArea(
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
      ),
    );
  }
}