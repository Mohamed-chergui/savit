
import 'package:go_router/go_router.dart';
import 'package:wordsapp/screens/homepage.dart';
import 'package:wordsapp/screens/navbar.dart';
import 'package:wordsapp/screens/search_screen.dart';
import 'package:wordsapp/screens/settings_screen.dart';
import 'package:wordsapp/screens/word_page.dart';
import 'package:wordsapp/screens/words.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) => Navbar(child: child), 
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const Homepage(),
        ),
        GoRoute(
          path: '/words',
          builder: (context, state) => const Words(),
        ) , 
        GoRoute(
          path: '/wordPage',
          builder: (context, state) => const WordPage(),
        ) ,
        GoRoute(
          path: '/searchPage',
          builder: (context, state) => const SearchScreen(),
        ) ,
        GoRoute(
          path: '/settingsPage',
          builder: (context, state) => const SettingsScreen(),
        ) ,
      ],
    ),
  ],
);