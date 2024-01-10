import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_player/controller/audiopalyer_controller.dart';
import 'package:music_player/controller/search_controller.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/image_constants.dart';
import 'package:music_player/view/authentication/login_screen.dart';
import 'package:music_player/view/bottom_navigationbar/bottom_navigation.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isWaiting = true;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      isWaiting = false;
      setState(() {});
    });
    getData();
    super.initState();
  }

  Future<void> getData() async {
    Provider.of<PlayNowController>(context, listen: false).fetchDeviceSongs();
    Provider.of<SearchControllerProvider>(context, listen: false)
        .fetchDeviceSongs();
  }

  @override
  Widget build(BuildContext context) {
    if (isWaiting == false) {
      return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BottomNavigationWidget();
          } else {
            return LoginScreen();
          }
        },
      );
    } else {
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
}
