import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/png_icons.dart';

class PlaynowScreen extends StatelessWidget {
  const PlaynowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kHeight10 = SizedBox(height: 10);
    final kHeight5 = SizedBox(height: 5);
    final kWidth10 = SizedBox(width: 10);
    final kWidth5 = SizedBox(width: 5);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.themeBlueColor,
        elevation: 0,
        title: Text("Playing Now"),
        titleTextStyle: TextStyle(
            fontFamily: "Gilroy",
            fontSize: 20,
            color: ConstantColors.themeWhiteColor,
            fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      backgroundColor: ConstantColors.themeBlueColor,
      body: Column(
        children: [
          Center(
            child: Container(
              height: 263,
              width: 263,
              color: Colors.amber,
            ),
          ),
          kHeight10,
          kHeight10,
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Title",
                            style: TextStyle(
                                color: ConstantColors.themeWhiteColor,
                                fontSize: 24),
                          ),
                          kHeight5,
                          Text(
                            "Artist Name",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                            style: TextStyle(
                              color: ConstantColors.lightblueColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Image.asset(
                    IconsPng.heartPng,
                    color: ConstantColors.unSelectedIndex,
                  ),
                  // SizedBox(
                  //   width: 29,
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
