// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) =>
      "${Intl.plural(count, one: 'Note', other: 'Notes')}";

  static String m1(date, hour) => "Hoy ${date} a las ${hour}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Accept"),
        "allTime": MessageLookupByLibrary.simpleMessage("All Time"),
        "appName": MessageLookupByLibrary.simpleMessage("Notes App"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteNote": MessageLookupByLibrary.simpleMessage("Delete Note?"),
        "deleteNoteDescription": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete the note?, this action can\'t be undone."),
        "done": MessageLookupByLibrary.simpleMessage("Done"),
        "label": MessageLookupByLibrary.simpleMessage("Label"),
        "notNoteYet": MessageLookupByLibrary.simpleMessage("No notes yet"),
        "note": m0,
        "noteDescription": MessageLookupByLibrary.simpleMessage("Description"),
        "noteTitle": MessageLookupByLibrary.simpleMessage("Title"),
        "pinned": MessageLookupByLibrary.simpleMessage("Pinned"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "titleRequired":
            MessageLookupByLibrary.simpleMessage("Title and note is required"),
        "todayAt": m1
      };
}
