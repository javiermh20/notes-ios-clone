// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Translate {
  Translate();

  static Translate? _current;

  static Translate get current {
    assert(_current != null,
        'No instance of Translate was loaded. Try to initialize the Translate delegate before accessing Translate.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Translate> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Translate();
      Translate._current = instance;

      return instance;
    });
  }

  static Translate of(BuildContext context) {
    final instance = Translate.maybeOf(context);
    assert(instance != null,
        'No instance of Translate present in the widget tree. Did you add Translate.delegate in localizationsDelegates?');
    return instance!;
  }

  static Translate? maybeOf(BuildContext context) {
    return Localizations.of<Translate>(context, Translate);
  }

  /// `Notes App`
  String get appName {
    return Intl.message(
      'Notes App',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Buscar`
  String get search {
    return Intl.message(
      'Buscar',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Hecho`
  String get done {
    return Intl.message(
      'Hecho',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Aceptar`
  String get accept {
    return Intl.message(
      'Aceptar',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get cancel {
    return Intl.message(
      'Cancelar',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar`
  String get delete {
    return Intl.message(
      'Eliminar',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `¿Eliminar nota?`
  String get deleteNote {
    return Intl.message(
      '¿Eliminar nota?',
      name: 'deleteNote',
      desc: '',
      args: [],
    );
  }

  /// `¿Seguro que quieres eliminar la nota?, esta acción no se puede deshacer.`
  String get deleteNoteDescription {
    return Intl.message(
      '¿Seguro que quieres eliminar la nota?, esta acción no se puede deshacer.',
      name: 'deleteNoteDescription',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =1 {Nota} other{Notas}}`
  String note(num count) {
    return Intl.plural(
      count,
      one: 'Nota',
      other: 'Notas',
      name: 'note',
      desc: '',
      args: [count],
    );
  }

  /// `Notas guardadas`
  String get allTime {
    return Intl.message(
      'Notas guardadas',
      name: 'allTime',
      desc: '',
      args: [],
    );
  }

  /// `Notas Favoritas`
  String get pinned {
    return Intl.message(
      'Notas Favoritas',
      name: 'pinned',
      desc: '',
      args: [],
    );
  }

  /// `Aún no tienes notas guardadas`
  String get notNoteYet {
    return Intl.message(
      'Aún no tienes notas guardadas',
      name: 'notNoteYet',
      desc: '',
      args: [],
    );
  }

  /// `Título`
  String get noteTitle {
    return Intl.message(
      'Título',
      name: 'noteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Descripción`
  String get noteDescription {
    return Intl.message(
      'Descripción',
      name: 'noteDescription',
      desc: '',
      args: [],
    );
  }

  /// `El título y la nota es requerido`
  String get titleRequired {
    return Intl.message(
      'El título y la nota es requerido',
      name: 'titleRequired',
      desc: '',
      args: [],
    );
  }

  /// `Hoy {date} a las {hour}`
  String todayAt(Object date, Object hour) {
    return Intl.message(
      'Hoy $date a las $hour',
      name: 'todayAt',
      desc: '',
      args: [date, hour],
    );
  }

  /// `Etiqueta`
  String get label {
    return Intl.message(
      'Etiqueta',
      name: 'label',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Translate> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Translate> load(Locale locale) => Translate.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
