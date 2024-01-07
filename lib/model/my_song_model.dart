class MySongsModel {
  int id;
  String title;
  String displayName;
  String artist;
  String url;
  int? duration;
  bool? favorites;
  String data;

  MySongsModel({
    required this.id,
    required this.title,
    required this.displayName,
    required this.artist,
    required this.url,
    required this.duration,
    this.favorites = false,
    required this.data,
  });
}
