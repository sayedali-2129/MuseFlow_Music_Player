import 'package:flutter/material.dart';
import 'package:music_player/model/my_song_model.dart';
import 'package:music_player/model/playlist_model.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlaylistController with ChangeNotifier {
  OnAudioQuery audioQuery = OnAudioQuery();
  List<MySongsModel> allSongsList = [];

  List<PlayListModelList> playlists = [];
  List<MySongsModel> playlistSongsadd = [];
  List<MySongsModel> favorites = [];
  List<AlbumModel> albums = [];

  getAlbums() async {
    albums = await audioQuery.queryAlbums();
  }

  newPlaylist(String? name, String? count) {
    playlists.add(PlayListModelList(name: name!, count: count!));
    notifyListeners();
  }

  removePlaylist(int index) {
    playlists.removeAt(index);
    notifyListeners();
  }

  addSongToPlalist(MySongsModel songs, BuildContext context) {
    playlistSongsadd.add(songs);
    notifyListeners();
  }

  favoriteSongs(MySongsModel song) {
    if (favorites.contains(song)) {
      favorites.remove(song);
    } else {
      favorites.add(song);
    }
    notifyListeners();
  }

  fetchDeviceSongs() async {
    final List<SongModel> deviceSongs = await audioQuery.querySongs(
      sortType: SongSortType.DATE_ADDED,
      orderType: OrderType.DESC_OR_GREATER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
    allSongsList = deviceSongs
        .map((e) => MySongsModel(
              id: e.id,
              title: e.title,
              displayName: e.displayNameWOExt,
              artist: e.artist!,
              url: e.uri!,
              data: e.data,
              duration: e.duration,
            ))
        .toList();
    notifyListeners();
  }
}
