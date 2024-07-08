// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(count) =>
      "${Intl.plural(count, one: 'Nota', other: 'Notas')}";

  static String m1(date, hour) => "Hoy ${date} a las ${hour}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Aceptar"),
        "allTime": MessageLookupByLibrary.simpleMessage("Notas guardadas"),
        "appName": MessageLookupByLibrary.simpleMessage("Notes App"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "delete": MessageLookupByLibrary.simpleMessage("Eliminar"),
        "deleteNote": MessageLookupByLibrary.simpleMessage("¿Eliminar nota?"),
        "deleteNoteDescription": MessageLookupByLibrary.simpleMessage(
            "¿Seguro que quieres eliminar la nota?, esta acción no se puede deshacer."),
        "done": MessageLookupByLibrary.simpleMessage("Hecho"),
        "label": MessageLookupByLibrary.simpleMessage("Etiqueta"),
        "notNoteYet": MessageLookupByLibrary.simpleMessage(
            "Aún no tienes notas guardadas"),
        "note": m0,
        "noteDescription": MessageLookupByLibrary.simpleMessage("Descripción"),
        "noteTitle": MessageLookupByLibrary.simpleMessage("Título"),
        "pinned": MessageLookupByLibrary.simpleMessage("Notas Favoritas"),
        "search": MessageLookupByLibrary.simpleMessage("Buscar"),
        "titleRequired": MessageLookupByLibrary.simpleMessage(
            "El título y la nota es requerido"),
        "todayAt": m1
      };
}
