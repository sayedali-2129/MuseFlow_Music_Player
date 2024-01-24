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
  List<SongModel> albumSongsList = [];
  int selectrdAlbumId = 0;

  int selectedAlbumIndex = 0;

  Future<void> setSelectedAlbum(int albumId) async {
    selectrdAlbumId = albumId;
    await getAlbumSongs();
    notifyListeners();
  }

  Future<void> getAlbumSongs() async {
    albumSongsList = await audioQuery.queryAudiosFrom(
      AudiosFromType.ALBUM,
      selectrdAlbumId,
      sortType: SongSortType.ARTIST,
    );
    notifyListeners();
  }

  selectedAlbum(int index) {
    selectedAlbumIndex = index;
    notifyListeners();
  }

  newPlaylist(String? name, String? count, int? id) {
    playlists.add(PlayListModelList(name: name!, count: count!, id: id!));
    notifyListeners();
  }

  removePlaylist(int index) {
    playlists.removeAt(index);
    notifyListeners();
  }

  addSongToPlalist(MySongsModel songs, PlayListModelList playList) {
    if (!playList.playlistSongs.contains(songs)) {
      playList.playlistSongs.add(songs);
    }
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

  // getAlbums() async {
  //   final List<AlbumModel> albumSongs = await audioQuery.queryAlbums(
  //       sortType: AlbumSortType.ALBUM,
  //       orderType: OrderType.ASC_OR_SMALLER,
  //       uriType: UriType.EXTERNAL,
  //       ignoreCase: true);

  //   albums = albumSongs
  //       .map((e) => AlbumSongsModel(
  //           id: e.id,
  //           title: "",
  //           artist: e.artist!,
  //           album: e.album,
  //           genre: "",
  //           filePath: ""))
  //       .toList();
  //   notifyListeners();
  // }

  // getAlbumSongs() async {
  //   final List<SongModel> album_songs = await audioQuery.querySongs(
  //     sortType: SongSortType.ALBUM,
  //     orderType: OrderType.ASC_OR_SMALLER,
  //     uriType: UriType.EXTERNAL,
  //     ignoreCase: true,
  //   );
  //   albumSongsList = album_songs
  //       .map((e) => MySongsModel(
  //           id: e.id,
  //           title: e.title,
  //           displayName: e.displayNameWOExt,
  //           artist: e.artist!,
  //           url: e.uri!,
  //           duration: e.duration,
  //           data: e.data))
  //       .toList();
  //   notifyListeners();

  // }
}
