import 'package:flutter/material.dart';
import 'package:notes_javiermh/views/home/HomeScreen.dart';
import 'package:notes_javiermh/views/splashscreen/SplashScreen.dart';

class AppNotes extends StatelessWidget {
  const AppNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

