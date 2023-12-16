import 'package:flutter/material.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/view/play_now_screen/play_now_screen.dart';

class TileBuilder extends StatelessWidget {
  const TileBuilder(
      {super.key,
      required this.categoryTitle,
      required this.songTitle,
      required this.artistName,
      required this.image});

  final String categoryTitle;
  final String songTitle;
  final String artistName;
  final String image;

  @override
  Widget build(BuildContext context) {
    final kHeight10 = SizedBox(height: 10);
    final kHeight5 = SizedBox(height: 5);
    final kWidth10 = SizedBox(width: 10);
    final kWidth5 = SizedBox(width: 5);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryTitle,
            style: TextStyle(
                color: ConstantColors.themeWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
          kHeight5,
          Container(
            width: MediaQuery.of(context).size.width,
            height: 243,
            // color: Colors.amber,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: 16,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlaynowScreen(),
                      ));
                },
                child: Container(
                  height: 243,
                  width: 190,
                  // color: Colors.blue,
                  child: Column(
                    children: [
                      Container(
                        height: 190,
                        width: 190,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                                image: AssetImage(image), fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      kHeight5,
                      Column(
                        children: [
                          Text(
                            songTitle,
                            style: TextStyle(
                                color: ConstantColors.themeWhiteColor,
                                fontSize: 18),
                          ),
                          Text(
                            artistName,
                            style: TextStyle(
                                color: ConstantColors.lightblueColor,
                                fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
