class Note{
  String title;
  String description;
  String date;
  String hour;
  String? folder;

  Note({
    required this.title,
    required this.description,
    required this.date,
    required this.hour,
    this.folder,
  });
}