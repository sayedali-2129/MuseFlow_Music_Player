import 'package:flutter/material.dart';
import 'package:music_player/utils/color_constants.dart';

class TileBuilder extends StatelessWidget {
  const TileBuilder(
      {super.key,
      required this.songTitle,
      required this.artistName,
      required this.image,
      this.onTap});

  final String songTitle;
  final String artistName;
  final String image;
  final onTap;

  @override
  Widget build(BuildContext context) {
    final kHeight10 = SizedBox(height: 10);
    final kHeight5 = SizedBox(height: 5);
    final kWidth10 = SizedBox(width: 10);
    final kWidth5 = SizedBox(width: 5);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 190,
          child: Column(
            children: [
              Container(
                height: 190,
                width: 190,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
              kHeight5,
              Expanded(
                child: Column(
                  children: [
                    Text(
                      songTitle,
                      style: TextStyle(
                          color: ConstantColors.themeWhiteColor, fontSize: 18),
                    ),
                    Text(
                      artistName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: ConstantColors.lightblueColor, fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
