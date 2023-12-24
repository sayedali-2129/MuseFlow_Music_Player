import 'package:flutter/material.dart';
import 'package:music_player/controller/api_controller.dart';
import 'package:music_player/controller/audiopalyer_controller.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/png_icons.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
    iconImage = Image.asset(
      isPlayingSong ? IconsPng.pausePng : IconsPng.playButton,
      color: ConstantColors.themeWhiteColor,
    );
  }

  bool isPlayingSong = true;

  Image iconImage = Image.asset(IconsPng.pausePng);

  @override
  Widget build(BuildContext context) {
    final kHeight10 = SizedBox(height: 10);
    final kHeight5 = SizedBox(height: 5);
    final kWidth10 = SizedBox(width: 10);
    final kWidth5 = SizedBox(width: 5);
    PlayNowController playerController =
        Provider.of<PlayNowController>(context);

    ApiController apiController = Provider.of(context);
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
                    image: NetworkImage(
                      apiController.musicApiResponce.music?[index].image ?? "",
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
                            apiController
                                    .musicApiResponce.music?[index].title ??
                                "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ConstantColors.themeWhiteColor,
                                fontSize: 24),
                          ),
                          kHeight5,
                          Text(
                            apiController
                                    .musicApiResponce.music?[index].artist ??
                                "".toUpperCase(),
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
                Text(
                    apiController.musicApiResponce.music?[index].duration
                            .toString() ??
                        "",
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
                width: 60,
              ),
              GestureDetector(
                  onTap: () async {
                    if (playerController.isPlaying == true) {
                      playerController.pauseSong();
                      setState(() {
                        iconImage = Image.asset(
                          IconsPng.playButton,
                          color: ConstantColors.themeWhiteColor,
                        );
                      });
                    } else if (playerController.isPlaying == false) {
                      playerController.resumeSong();
                      setState(() {
                        iconImage = Image.asset(
                          IconsPng.pausePng,
                          color: ConstantColors.themeWhiteColor,
                        );
                      });
                    }
                  },
                  child: iconImage),
              SizedBox(
                width: 60,
              ),
              GestureDetector(
                onTap: () {
                  playerController.nextSong();
                },
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
