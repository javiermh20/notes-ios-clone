import 'package:flutter/material.dart';
import 'package:notes_javiermh/AppNotes.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_javiermh/models/Note.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox('Notes');
  await Hive.openBox('Categories');
  runApp(const AppNotes());
}
