import 'package:flutter/material.dart';
import 'package:music_player/view/bottom_navigationbar/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Gilroy",
      ),
      home: BottomNavigationWidget(),
    );
  }
}
