import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/view/authentication/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ConstantColors.themeWhiteColor),
        backgroundColor: ConstantColors.themeBlueColor,
        title: Text(
          "Settings",
          style: TextStyle(
              color: ConstantColors.themeWhiteColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: ConstantColors.themeBlueColor,
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
            child: Row(
              children: [
                Text(
                  "SignOut",
                  style: TextStyle(
                      color: ConstantColors.themeWhiteColor, fontSize: 25),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
