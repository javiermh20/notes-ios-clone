import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:notes_javiermh/models/Note.dart';

import 'package:notes_javiermh/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class NoteAddScreen extends StatefulWidget {
  const NoteAddScreen({super.key});

  @override
  State<NoteAddScreen> createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentDescription = TextEditingController();

  String folder = '';
  late String date;
  late String hour;
  late Note newNote;
  late Note note;

  @override
  void initState() {
    super.initState();
    date = DateTime.now().toString().substring(0, 10);
    hour = DateTime.now().toString().substring(11, 16);
  }
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is Note) {
      note = arguments;
      _titleController.text = note.title;
      _contentDescription.text = note.description;
      folder = note.folder ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark ? const Color.fromRGBO(0, 0, 0, 1) : const Color.fromRGBO(242, 242, 247, 1),
      appBar: appBarNoteAdd(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text(Translate.current.todayAt(date, hour), style: const TextStyle(color: Colors.grey, fontSize: 14)),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: Translate.current.noteTitle,
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.amberAccent.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        // show folders
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        child: note.folder == null 
                          ? Text(Translate.current.label, style: const TextStyle(fontSize: 12)) 
                          : Text(folder, style: const TextStyle(fontSize: 12)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _contentDescription,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  hintText: Translate.current.noteDescription,
                  border: InputBorder.none,
                ),
                maxLines: 25,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBarNoteAdd(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(CupertinoIcons.back, color: Colors.amberAccent, size: 30),
        onPressed: () {
          Navigator.pop(context, null);
        },
      ),
      titleSpacing: -10,
      backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark ? const Color.fromRGBO(0, 0, 0, 1) : const Color.fromRGBO(242, 242, 247, 1),
      title: Text(Translate.current.note(0), style: const TextStyle(color: Colors.amberAccent, fontSize: 18)),
      actions: [
        IconButton(
          icon: Icon(CupertinoIcons.share, color: _titleController.text == '' || _contentDescription.text == '' ? Colors.grey : Colors.amberAccent),
          onPressed: _titleController.text == '' || _contentDescription.text == '' ? null : () {
            // share note
          }
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.amberAccent,
          ),
          onPressed: (){
          if(_titleController.text == '' || _contentDescription.text == ''){
            toastification.show(
              showProgressBar: false,
              context: context,
              closeButtonShowType: CloseButtonShowType.none,
              alignment: Alignment.bottomCenter,
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              type: ToastificationType.warning,
              title: Text(Translate.current.titleRequired),
              autoCloseDuration: const Duration(seconds: 3),
              applyBlurEffect: true,
            );
            return;
          }
          newNote = Note(
            title: _titleController.text,
            description: _contentDescription.text,
            date: date,
            hour: hour,
            folder: folder,
          );
          Navigator.pop(context, newNote);
        }, child: Text(Translate.current.done, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      ],
    );
  }
}
