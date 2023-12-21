import 'package:flutter/material.dart';
import 'package:music_player/database/songs_data.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/png_icons.dart';

class PlaynowScreen extends StatefulWidget {
  const PlaynowScreen({
    required this.index,
    super.key,
  });
  final int index;
  @override
  State<PlaynowScreen> createState() => _PlaynowScreenState(index);
}

class _PlaynowScreenState extends State<PlaynowScreen> {
  int index;
  _PlaynowScreenState(this.index);
  double currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    final kHeight10 = SizedBox(height: 10);
    final kHeight5 = SizedBox(height: 5);
    final kWidth10 = SizedBox(width: 10);
    final kWidth5 = SizedBox(width: 5);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ConstantColors.themeWhiteColor),
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(
                      SongsData.songs[index]['cover image'],
                    ),
                    fit: BoxFit.cover)),
          )),
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
                            SongsData.songs[index]['song name'],
                            style: TextStyle(
                                color: ConstantColors.themeWhiteColor,
                                fontSize: 24),
                          ),
                          kHeight5,
                          Text(
                            SongsData.songs[index]['artist name']
                                .toString()
                                .toUpperCase(),
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
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  IconsPng.volumePng,
                  color: ConstantColors.unSelectedIndex,
                  height: 27,
                  width: 27,
                ),
                Row(
                  children: [
                    Image.asset(
                      IconsPng.repeatPng,
                      color: ConstantColors.unSelectedIndex,
                      height: 27,
                      width: 27,
                    ),
                    kWidth10,
                    Image.asset(
                      IconsPng.shufflePng,
                      color: ConstantColors.unSelectedIndex,
                      height: 27,
                      width: 27,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "00.50",
                  style: TextStyle(
                      fontSize: 14, color: ConstantColors.lightblueColor),
                ),
                Text("04.00",
                    style: TextStyle(
                        fontSize: 14, color: ConstantColors.lightblueColor)),
              ],
            ),
          ),
          Slider(
            value: currentSliderValue,
            max: 100,
            min: 0,
            activeColor: ConstantColors.themeWhiteColor,
            inactiveColor: Colors.grey,
            onChanged: (value) {
              currentSliderValue = value;
              setState(() {});
            },
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  IconsPng.nextBackwardPng,
                  color: ConstantColors.themeWhiteColor,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  IconsPng.playButton,
                  color: ConstantColors.themeWhiteColor,
                  // height: 50,
                  // width: 50,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  IconsPng.nextForwardPng,
                  color: ConstantColors.themeWhiteColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
