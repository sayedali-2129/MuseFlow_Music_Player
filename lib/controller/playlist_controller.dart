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
  // List<AlbumSongsModel> albums = [];
  // List<MySongsModel> albumSongsList = [];
  // int selectrdAlbumId = 0;

  // int selectedAlbumIndex = 0;

  List<AlbumModel> albums = [];
  List<MySongsModel> audioFiles = [];

  Future<void> loadAlbums() async {
    final albumsData = await audioQuery.queryAlbums(
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: AlbumSortType.ALBUM,
        ignoreCase: true,
        uriType: UriType.EXTERNAL);
    albums = albumsData;
    notifyListeners();
  }
// fcfmasl;dmasl;dmas
  // Future<void> loadAudioFilesForAlbum(String albumid) async {
  //   await audioQuery
  //       .queryAudiosFrom(AudiosFromType.ALBUM, albumid,
  //           orderType: OrderType.ASC_OR_SMALLER,
  //           sortType: SongSortType.ALBUM,
  //           ignoreCase: true)
  //       .then((songs) => songs = audioFiles);

  //   notifyListeners();
  // }

  // Future<void> setSelectedAlbum(int albumId) async {
  //   selectrdAlbumId = albumId;
  //   await getAlbumSongs();
  //   notifyListeners();
  // }

  // Future<void> getAlbumSongs() async {
  //   albumSongsList = await audioQuery.queryAudiosFrom(
  //     AudiosFromType.ALBUM,
  //     selectrdAlbumId,
  //     sortType: SongSortType.ARTIST,
  //   );
  //   notifyListeners();
  // }

  // selectedAlbum(int index) {
  //   selectedAlbumIndex = index;
  //   notifyListeners();
  // }

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

  alb() async {
    final List<SongModel> alb = await audioQuery.querySongs(
      sortType: SongSortType.ALBUM,
      orderType: OrderType.DESC_OR_GREATER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
    audioFiles = alb
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
  //   final albumSongs = await audioQuery.queryAlbums(
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
}

  // getAlbumSongs() async {
  //   final List<SongModel> album_songs = await audioQuery.queryAudiosFrom(
  //       AudiosFromType.ALBUM, selectrdAlbumId,
  //       sortType: SongSortType.ALBUM,
  //       orderType: OrderType.ASC_OR_SMALLER,
  //       ignoreCase: true);
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
  // Future<void> getAlbumSongs(String albumId) async {
  //   final albumSongsData =
  //       await audioQuery.queryAudiosFrom(AudiosFromType.ALBUM, albumId);

  //   albumSongsList = albumSongsData
  //       .map((audios) => MySongsModel(
  //           id: audios.id,
  //           title: audios.title,
  //           displayName: audios.displayNameWOExt,
  //           artist: audios.artist!,
  //           url: audios.uri!,
  //           duration: audios.duration,
  //           data: audios.data))
  //       .toList();
  //   notifyListeners();
  // }

