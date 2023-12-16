import 'package:flutter/material.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/custom_icons.dart';
import 'package:music_player/utils/png_icons.dart';
import 'package:music_player/view/home_screen/home_screen.dart';
import 'package:music_player/view/liked_songs_screen/likes_songs_screen.dart';
import 'package:music_player/view/profile_screen/profile_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int currentPageIndex = 0;
  final pages = [HomeScreen(), LikedSongsScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPageIndex,
          onTap: (value) {
            setState(() {
              currentPageIndex = value;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: ConstantColors.themeBlueColor,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  IconsPng.homePng,
                  height: 25,
                  width: 25,
                  color: currentPageIndex == 0
                      ? ConstantColors.themeWhiteColor
                      : ConstantColors.unSelectedIndex,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  IconsPng.heartPng,
                  height: 25,
                  width: 25,
                  color: currentPageIndex == 1
                      ? ConstantColors.themeWhiteColor
                      : ConstantColors.unSelectedIndex,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  IconsPng.userPng,
                  height: 25,
                  width: 25,
                  color: currentPageIndex == 2
                      ? ConstantColors.themeWhiteColor
                      : ConstantColors.unSelectedIndex,
                ),
                label: ""),
          ]),
    );
  }
}
