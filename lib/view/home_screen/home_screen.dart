import 'package:flutter/material.dart';
import 'package:music_player/controller/api_controller.dart';
import 'package:music_player/controller/audiopalyer_controller.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/png_icons.dart';
import 'package:music_player/view/home_screen/widgets/tile_builder.dart';
import 'package:music_player/view/play_now_screen/play_now_screen.dart';
import 'package:music_player/view/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    Provider.of<ApiController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // final kHeight10 = SizedBox(height: 10);
    // final kHeight5 = SizedBox(height: 5);
    // final kWidth10 = SizedBox(width: 10);
    final kWidth5 = SizedBox(width: 5);
    PlayNowController playerController =
        Provider.of<PlayNowController>(context);

    ApiController apiController = Provider.of(context);
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
                  itemCount: apiController.musicApiResponce.music?.length ?? 0,
                  itemBuilder: (context, index) => TileBuilder(
                    songTitle:
                        apiController.musicApiResponce.music?[index].title ??
                            "",
                    artistName:
                        apiController.musicApiResponce.music?[index].artist ??
                            "",
                    image: apiController.musicApiResponce.music?[index].image ??
                        "",
                    onTap: () {
                      Provider.of<PlayNowController>(context, listen: false)
                          .playSong(apiController
                                  .musicApiResponce.music?[index].source ??
                              "");
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
              ),
              // Trending
              Text(
                "Trending",
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
                  itemCount: apiController.musicApiResponce.music?.length ?? 0,
                  itemBuilder: (context, index) => TileBuilder(
                    songTitle:
                        apiController.musicApiResponce.music?[index].title ??
                            "",
                    artistName:
                        apiController.musicApiResponce.music?[index].artist ??
                            "",
                    image: apiController.musicApiResponce.music?[index].image ??
                        "",
                    onTap: () {
                      Provider.of<PlayNowController>(context, listen: false)
                          .playSong(apiController
                                  .musicApiResponce.music?[index].source ??
                              "");
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
