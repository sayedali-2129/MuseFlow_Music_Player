class PlayerModel {
  String songName;
  String artistName;
  String songCover;
  String songUrl;
  List<Map>? songList;

  PlayerModel(
      {required this.songName,
      required this.artistName,
      required this.songCover,
      required this.songUrl,
      this.songList});
}
