import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/settings_provider.dart';
import 'package:wordsapp/widgets/utils/settingsPage/profile_settings.dart';
import 'package:wordsapp/widgets/utils/settingsPage/theme_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
     final settingsProvider  = Provider.of<SettingsProvider>(context) ; 
    return  Scaffold(
      backgroundColor:  theme.scaffoldBackgroundColor,
      appBar: AppBar( 
        title: const Text('settings '  , 
        style: TextStyle(
                    fontFamily: "roboto" , 
                    fontSize: 20 , 
                    fontWeight: FontWeight.w700 , 
      ) ,),
      leading:  Icon(Icons.info_outline_rounded , color:settingsProvider.textColor(),) ,
      actions:  [
       GestureDetector(
        onTap: () {

        },
        child :   const Padding(
         padding: EdgeInsets.only( right : 15.0 , top: 4),
          child: Icon(Icons.logout_rounded , color: Color.fromARGB(255, 219, 131, 120),),
        ) )
      ],
      ),
      body:  const SafeArea(child: 
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(top : 8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ProfileSettings(),
              ) , 
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0 , horizontal: 8) ,
                child: ThemeSettings(),
              ) ,
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ThemeSettings(),
              ) ,
          
            ],
          ),
        ),
      )) ,
    );
  }
}