import 'package:music_player/model/my_song_model.dart';

class PlayListModelList {
  String name;
  String count;
  List<MySongsModel>? playlistSongs = [];

  PlayListModelList(
      {required this.name, required this.count, this.playlistSongs});
}
