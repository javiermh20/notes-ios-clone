class Note{
  int id;
  String title;
  String description;
  String author;
  String date;
  String hour;
  String? folder;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.date,
    required this.hour,
    this.folder,
  });
}