import 'package:flutter/material.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/png_icons.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {super.key,
      required this.name,
      required this.count,
      required this.onTap});
  final String name;
  final String count;
  final onTap;

  @override
  Widget build(BuildContext context) {
    final kHeight5 = SizedBox(height: 5);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
                    name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: ConstantColors.themeWhiteColor, fontSize: 15),
                  ),
                  Text(
                    count,
                    style: TextStyle(
                        color: ConstantColors.themeWhiteColor, fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
