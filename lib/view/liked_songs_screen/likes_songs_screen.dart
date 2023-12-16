import 'package:flutter/material.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/image_constants.dart';

class LikedSongsScreen extends StatelessWidget {
  const LikedSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kHeight5 = SizedBox(height: 5);
    return Scaffold(
      backgroundColor: ConstantColors.themeBlueColor,
      appBar: AppBar(
        title: Text("Liked Songs"),
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
            crossAxisCount: 2, mainAxisExtent: 230),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 152,
            // color: Colors.amber,
            child: Column(
              children: [
                Container(
                  height: 160,
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(ConstantImage.sampleImage),
                          fit: BoxFit.cover)),
                ),
                kHeight5,
                Column(
                  children: [
                    Text(
                      "Song Name",
                      style: TextStyle(
                          color: ConstantColors.themeWhiteColor, fontSize: 18),
                    ),
                    Text(
                      "Artist Name",
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
