import 'package:flutter/material.dart';
import 'package:music_player/controller/playlist_controller.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/image_constants.dart';
import 'package:music_player/view/categories/albums/albumTile.dart';
import 'package:music_player/view/categories/albums/album_songs.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<PlaylistController>(context, listen: false).getAlbumSongs();
    final albumProvider = Provider.of<PlaylistController>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ConstantColors.themeWhiteColor),
        backgroundColor: ConstantColors.themeBlueColor,
        title: Text(
          "Albums (${albumProvider.albums.length})",
          style: TextStyle(
              color: ConstantColors.themeWhiteColor,
              fontWeight: FontWeight.bold),
        ),
        titleSpacing: 0,
      ),
      backgroundColor: ConstantColors.themeBlueColor,
      body: ListView.builder(
        itemCount: albumProvider.albums.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlbumSongs(
                    index: index,
                  ),
                ));
          },
          child: AlbumTile(
            songTitle: albumProvider.albums[index].album,
            artist: albumProvider.albums[index].artist ?? "",
            image: QueryArtworkWidget(
              id: albumProvider.albums[index].id,
              type: ArtworkType.ALBUM,
              keepOldArtwork: true,
              artworkBorder: BorderRadius.circular(10),
              nullArtworkWidget: Image.asset(ConstantImage.mainLogoPng),
            ),
          ),
        ),
      ),
    );
  }
}
