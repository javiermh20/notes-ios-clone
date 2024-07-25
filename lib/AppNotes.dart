import 'package:flutter/material.dart';

import 'package:notes_javiermh/views/splashscreen/SplashScreen.dart';
import 'package:notes_javiermh/views/note/NoteAddScreen.dart';
import 'package:notes_javiermh/views/note/NoteHomeScreen.dart';

import 'package:notes_javiermh/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class AppNotes extends StatelessWidget {
  const AppNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        Translate.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Translate.delegate.supportedLocales,
      title: 'Notes',
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
        '/home': (context) => const NoteHomeScreen(),
        '/noteAdd': (context) =>  const NoteAddScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

