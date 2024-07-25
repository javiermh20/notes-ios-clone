
import 'package:hive/hive.dart';

part 'Note.g.dart';

@HiveType(typeId: 1)
class Note{
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String date;
  @HiveField(3)
  String hour;
  @HiveField(4)
  String? folder;

  Note({
    required this.title,
    required this.description,
    required this.date,
    required this.hour,
    this.folder,
  });

  static Note fromJson(Map<String, dynamic> json) => Note(
    title: json['title'],
    description: json['description'],
    date: json['date'],
    hour: json['hour'],
    folder: json['folder'],
  );
}