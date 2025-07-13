import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/collections.dart';
import 'package:wordsapp/Providers/dataProvide.dart';
import 'package:wordsapp/Providers/wods_provider_logic/words.dart';
import 'package:wordsapp/Providers/word_provider.dart';
import 'package:wordsapp/Routers/router.dart';

 void main() {
  runApp(const MyApp());
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
      ],
      child:  MaterialApp.router(
        routerConfig: appRouter,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 74, 103, 135) ,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Wordsapp',
      ),
    );
  }
}