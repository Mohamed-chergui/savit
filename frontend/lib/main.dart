import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/collections.dart';
import 'package:wordsapp/Providers/dataProvide.dart';
import 'package:wordsapp/Providers/settings_provider.dart';
import 'package:wordsapp/Providers/wods_provider_logic/words.dart';
import 'package:wordsapp/Providers/word_provider.dart';
import 'package:wordsapp/Routers/router.dart';

 void main() {
  runApp(    
      const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()), 
        ChangeNotifierProvider(create: (_) => Collection()), 
        ChangeNotifierProvider(create: (_) => WordsProvider()),
        ChangeNotifierProvider(create: (_) => WordProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      
      child:  Consumer<SettingsProvider>(
        builder: (context, themeProvider,_) {
          SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: themeProvider.isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
        systemNavigationBarIconBrightness: themeProvider.isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
          return  MaterialApp.router(
          routerConfig: appRouter,
          // app Theme 
          theme: ThemeData(
            primaryColor: themeProvider.mainColorOptions[themeProvider.mainColorindex] ,
            brightness: !themeProvider.isDarkMode ? Brightness.dark : Brightness.light,
            // Colros.teal for the scheme
            useMaterial3: true,
            scaffoldBackgroundColor: themeProvider.backgroundColor() ,
            cardColor: themeProvider.cardColor() , 
            textTheme:  TextTheme(
            bodyLarge: TextStyle(color: themeProvider.textColor() , ),
            bodyMedium: TextStyle(color: themeProvider.textColor() ,),
            titleLarge: TextStyle(color: themeProvider.textColor() ,  ),
                    ) , 
                    appBarTheme:  AppBarTheme(
                      color: themeProvider.appBarColor() , 
                      titleTextStyle: TextStyle(
                        color: themeProvider.textColor()
                      )
                    ) , 

                    iconTheme: IconThemeData(
                      color:  themeProvider.iconColor() , 
                    )
          ),
          debugShowCheckedModeBanner: false,
          title: 'Wordsapp',
        ) ; 
        },
        
      ),
      // end Theme
    );
  }
}