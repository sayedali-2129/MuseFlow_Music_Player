import 'package:music_player/model/my_song_model.dart';

class PlayListModelList {
  String name;
  String count;
  int id;
  List<MySongsModel> playlistSongs;

  PlayListModelList(
      {required this.id,
      required this.name,
      required this.count,
      this.playlistSongs = const []});
}
