import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:notes_javiermh/generated/l10n.dart';
import 'package:notes_javiermh/models/Note.dart';
import 'package:notes_javiermh/utils/Utils.dart';
import 'package:notes_javiermh/views/note/NoteAddScreen.dart';

class NoteHomeScreen extends StatefulWidget {
  const NoteHomeScreen({super.key});

  @override
  State<NoteHomeScreen> createState() => _NoteHomeScreenState();
}

class _NoteHomeScreenState extends State<NoteHomeScreen> {
  bool showPinnedNotes = true;
  bool isSelectedView = false;

  List<Note> notes = [
    Note(
      title: 'Meeting with the team',
      description: 'Discuss the new project',
      date: '2024-07-07',
      hour: '10:00 AM',
      folder: 'Work',
    ),
    Note(
      title: 'Buy groceries',
      description: 'Milk, eggs, bread, and fruits',
      date: '2024-07-01',
      hour: '10:00 AM',
      folder: 'Personal',
    ),
    Note(
        title: 'Mexico and USA trip',
        description: 'Discuss the trip in Mexico and USA',
        date: '2021-06-25',
        hour: '10:00 PM'),
  ];
  List<Note> pinnedNotes = [];

  TextEditingController searchNoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? const Color.fromRGBO(0, 0, 0, 1)
              : const Color.fromRGBO(242, 242, 247, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor:
                MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? const Color.fromRGBO(0, 0, 0, 1)
                    : const Color.fromRGBO(242, 242, 247, 1),
            pinned: true,
            expandedHeight: 100.0,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                var top = constraints.biggest.height;
                var leftPadding = top > 100.0 ? 16.0 : 0.0;
                var alignment = top > 100.0 ? Alignment.bottomLeft : Alignment.bottomCenter;
                return FlexibleSpaceBar(
                  titlePadding: EdgeInsetsDirectional.only(start: leftPadding, bottom: 8),
                  centerTitle: false,
                  title: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment: alignment,
                    child: Text(Translate.current.note(0), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                  ),
                );
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(CupertinoIcons.ellipsis_circle,
                    color: Colors.amberAccent),
                onPressed: () {
                  // show optionsMenu
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoSearchTextField(controller: searchNoteController),
                  const SizedBox(height: 24),
                  Visibility(
                    visible: pinnedNotes.isNotEmpty,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(CupertinoIcons.pin_fill, size: 18, color: Colors.amberAccent),
                            const SizedBox(width: 6),
                            Text(Translate.current.pinned, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                            const Spacer(),
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: IconButton(
                                onPressed: () {
                                  setState(() => showPinnedNotes = !showPinnedNotes);
                                },
                                icon: Icon(
                                  showPinnedNotes
                                      ? CupertinoIcons.chevron_down
                                      : CupertinoIcons.right_chevron,
                                  color: Colors.amberAccent,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Visibility(
                          visible: showPinnedNotes,
                          child: containerNote(pinnedNotes),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: pinnedNotes.isNotEmpty ? 12 : 0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(CupertinoIcons.calendar, size: 18, color: Colors.amberAccent),
                          const SizedBox(width: 6),
                          Text(Translate.current.allTime, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      containerNote(notes),
                      const SizedBox(height: 12),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? const Color.fromRGBO(16, 13, 20, 1)
            : const Color.fromRGBO(231, 229, 240, 1),
        width: double.infinity,
        height: 50,
        child: Stack(
          children: [
            Center(
              child: notes.isEmpty
                  ? Text(Translate.current.notNoteYet,
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.center)
                  : Text(
                      '${notes.length} ${Translate.current.note(notes.length == 1 ? 1 : 0).toLowerCase()}',
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () async {
                  Note? note = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteAddScreen(),
                    ),
                  );
                  if (note == null) return;
                  setState(() => notes.add(note));
                },
                icon: const Icon(CupertinoIcons.square_pencil, color: Colors.amberAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget containerNote(List<Note> notes) {
    return Container(
      decoration: BoxDecoration(
        color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? const Color.fromRGBO(28, 28, 30, 1)
            : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          for (var i in notes)
            Column(
              children: [
                InkWell(
                  onTap: () async {
                    Note? note = await Navigator.push(context, MaterialPageRoute(builder: (context) => NoteAddScreen(note: i)));
                    if (note == null) return;
                    setState(() {
                      notes.remove(i);
                      notes.add(note);
                    });
                  },
                  child: contentCard(i),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void dialogDeleteNote(Note note) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(Translate.current.deleteNote),
          content: Text(Translate.current.deleteNoteDescription),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.amberAccent,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(Translate.current.cancel),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.amberAccent,
              ),
              onPressed: () {
                if (pinnedNotes.contains(note)) {
                  setState(() {
                    pinnedNotes.remove(note);
                  });
                }

                setState(() {
                  notes.remove(note);
                });
                Navigator.pop(context);
              },
              child: Text(Translate.current.delete),
            ),
          ],
        );
      },
    );
  }

  Widget contentCard(Note note) {
    return Stack(
      children: [
        Positioned(
          top: 1,
          left: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
                pinnedNotes.contains(note)
                    ? CupertinoIcons.pin_slash_fill
                    : CupertinoIcons.pin_fill,
                color: Colors.white),
          ),
        ),
        Positioned(
          right: 1,
          top: 1,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(CupertinoIcons.delete_solid, color: Colors.white)),
        ),
        Dismissible(
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.endToStart) {
              // delete note
              dialogDeleteNote(note);
              return false;
            } else {
              setState(() {
                pinnedNotes.contains(note)
                    ? pinnedNotes.remove(note)
                    : pinnedNotes.add(note);
              });
              return true;
            }
          },
          key: UniqueKey(),
          child: Container(
            decoration: BoxDecoration(
              color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? const Color.fromRGBO(28, 28, 30, 1)
                : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(Utils().truncateWithEllipsis(30, note.title), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${note.hour} ${Utils().truncateWithEllipsis(45, note.description)}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  note.folder == null || note.folder == ''
                    ? const SizedBox()
                    : Row(
                        children: [
                          const Icon(CupertinoIcons.folder, color: Colors.grey, size: 14),
                          const SizedBox(width: 6),
                          Text(note.folder!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
