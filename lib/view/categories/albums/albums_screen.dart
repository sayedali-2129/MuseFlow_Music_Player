import 'package:flutter/material.dart';
import 'package:music_player/controller/playlist_controller.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/view/home_screen/widgets/song_list_tile.dart';
import 'package:provider/provider.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final albumProvider = Provider.of<PlaylistController>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ConstantColors.themeWhiteColor),
        backgroundColor: ConstantColors.themeBlueColor,
        title: Text(
          "Albums",
          style: TextStyle(
              color: ConstantColors.themeWhiteColor,
              fontWeight: FontWeight.bold),
        ),
        titleSpacing: 0,
      ),
      backgroundColor: ConstantColors.themeBlueColor,
      body: ListView.builder(
        itemCount: albumProvider.albums.length,
        itemBuilder: (context, index) => SongListTile(
          songTitle: albumProvider.albums[index].album,
          artist: "",
        ),
      ),
    );
  }
}
