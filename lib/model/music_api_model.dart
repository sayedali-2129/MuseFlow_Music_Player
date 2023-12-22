class MusicApiModel {
  List<Music>? music;

  MusicApiModel({
    this.music,
  });

  factory MusicApiModel.fromJson(Map<String, dynamic> json) => MusicApiModel(
        music: json["music"] == null
            ? []
            : List<Music>.from(json["music"]!.map((x) => Music.fromJson(x))),
      );
}

class Music {
  String? id;
  String? title;
  String? album;
  String? artist;
  String? genre;
  String? source;
  String? image;
  int? trackNumber;
  int? totalTrackCount;
  int? duration;
  String? site;

  Music({
    this.id,
    this.title,
    this.album,
    this.artist,
    this.genre,
    this.source,
    this.image,
    this.trackNumber,
    this.totalTrackCount,
    this.duration,
    this.site,
  });

  factory Music.fromJson(Map<String, dynamic> json) => Music(
        id: json["id"],
        title: json["title"],
        album: json["album"],
        artist: json["artist"],
        genre: json["genre"],
        source: json["source"],
        image: json["image"],
        trackNumber: json["trackNumber"],
        totalTrackCount: json["totalTrackCount"],
        duration: json["duration"],
        site: json["site"],
      );
}
