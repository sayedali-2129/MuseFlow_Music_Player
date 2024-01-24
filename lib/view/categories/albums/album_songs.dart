import 'package:flutter/material.dart';
import 'package:music_player/controller/playlist_controller.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/view/home_screen/widgets/song_list_tile.dart';
import 'package:provider/provider.dart';

class AlbumSongs extends StatelessWidget {
  const AlbumSongs({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    Provider.of<PlaylistController>(context, listen: false).getAlbumSongs();
    final albumProvider = Provider.of<PlaylistController>(context);

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: ConstantColors.themeWhiteColor),
          titleSpacing: 0,
          backgroundColor: ConstantColors.themeBlueColor,
          title: Text(
            "${albumProvider.albums[index].album}",
            style:
                TextStyle(color: ConstantColors.themeWhiteColor, fontSize: 18),
          ),
        ),
        backgroundColor: ConstantColors.themeBlueColor,
        body: FutureBuilder(
          future:
              albumProvider.setSelectedAlbum(albumProvider.albums[index].id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: albumProvider.albumSongsList.length,
                itemBuilder: (context, index) => SongListTile(
                    songTitle:
                        albumProvider.albumSongsList[index].displayNameWOExt,
                    artist: albumProvider.albumSongsList[index].artist ?? ""),
              );
            }
          },
        ));
  }
}
