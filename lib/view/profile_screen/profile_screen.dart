import 'package:flutter/material.dart';
import 'package:music_player/utils/color_constants.dart';

import 'package:music_player/utils/png_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.themeBlueColor,
      body: Center(
          child: Image.asset(
        IconsPng.pausePng,
        height: 50,
        width: 50,
        color: Colors.amber,
      )),
    );
  }
}
