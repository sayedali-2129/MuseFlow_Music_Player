import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/image_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.themeBlueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ConstantImage.mainLogoPng,
              fit: BoxFit.fill,
              height: 224,
              width: 327,
            ),
            Lottie.asset(ConstantImage.loadingAnimationSplash,
                height: 150, width: 150)
          ],
        ),
      ),
    );
  }
}
