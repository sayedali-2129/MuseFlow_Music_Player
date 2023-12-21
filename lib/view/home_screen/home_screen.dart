import 'package:flutter/material.dart';
import 'package:music_player/database/songs_data.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/png_icons.dart';
import 'package:music_player/view/home_screen/widgets/tile_builder.dart';
import 'package:music_player/view/play_now_screen/play_now_screen.dart';
import 'package:music_player/view/search_screen/search_screen.dart';

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
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ));
            },
            child: Image.asset(
              IconsPng.searchPng,
              color: ConstantColors.themeWhiteColor,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recommended for you
              Text(
                "Recommended for you",
                style: TextStyle(
                    color: ConstantColors.themeWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              kWidth5,
              Container(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: SongsData.songs.length,
                  itemBuilder: (context, index) => TileBuilder(
                    songTitle: SongsData.songs[index]['song name'],
                    artistName: SongsData.songs[index]['artist name'],
                    image: SongsData.songs[index]['cover image'],
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaynowScreen(
                              index: index,
                            ),
                          ));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
