import 'package:flutter/material.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/image_constants.dart';

import 'package:music_player/utils/png_icons.dart';
import 'package:music_player/view/home_screen/widgets/tile_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kHeight10 = SizedBox(height: 10);
    final kHeight5 = SizedBox(height: 5);
    final kWidth10 = SizedBox(width: 10);
    final kWidth5 = SizedBox(width: 5);
    return Scaffold(
      backgroundColor: ConstantColors.themeBlueColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.themeBlueColor,
        elevation: 0,
        title: Text(
          "Hey, User",
          style: TextStyle(
              fontFamily: "Gilroy",
              fontWeight: FontWeight.bold,
              color: ConstantColors.themeWhiteColor),
        ),
        actions: [
          Image.asset(
            IconsPng.searchPng,
            color: ConstantColors.themeWhiteColor,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TileBuilder(
              categoryTitle: "Recommended for you",
              songTitle: "Believer",
              artistName: "Imagine Dragons",
              image: ConstantImage.sampleImage,
            ),
            TileBuilder(
              categoryTitle: "My Playlist",
              songTitle: "Believer",
              artistName: "Imagine Dragons",
              image: ConstantImage.sampleImage,
            ),
            TileBuilder(
              categoryTitle: "Liked Songs",
              songTitle: "Believer",
              artistName: "Imagine Dragons",
              image: ConstantImage.sampleImage,
            ),
            TileBuilder(
              categoryTitle: "Trending",
              songTitle: "Believer",
              artistName: "Imagine Dragons",
              image: ConstantImage.sampleImage,
            ),
          ],
        ),
      ),
    );
  }
}
