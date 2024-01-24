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

class AlbumSongsModel {
  final int id;
  final String title;
  final String artist;
  final String album;
  final String genre;
  final String filePath;

  AlbumSongsModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.genre,
    required this.filePath,
  });
}
