import 'package:flutter/material.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/png_icons.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kHeight5 = SizedBox(height: 5);
    return Scaffold(
      backgroundColor: ConstantColors.themeBlueColor,
      appBar: AppBar(
        title: Text("Your Playlists"),
        titleTextStyle: TextStyle(
            fontFamily: "Gilroy",
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: ConstantColors.themeWhiteColor),
        backgroundColor: ConstantColors.themeBlueColor,
        elevation: 0,
      ),
      body: GridView.builder(
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 200),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 152,
            // color: Colors.amber,
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ConstantColors.themeWhiteColor),
                    image: DecorationImage(
                        image: AssetImage(
                          IconsPng.playLsitPng,
                        ),
                        scale: 10,
                        invertColors: true),
                  ),
                  // child: Icon(
                  //   Icons.music_note,
                  //   color: ConstantColors.themeWhiteColor,
                  //   size: 80,
                  // ),
                ),
                kHeight5,
                Column(
                  children: [
                    Text(
                      "Playlist Name",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: ConstantColors.themeWhiteColor, fontSize: 15),
                    ),
                    Text(
                      "Songs count",
                      style: TextStyle(
                          color: ConstantColors.themeWhiteColor, fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
