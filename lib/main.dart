import 'package:flutter/material.dart';
import 'package:music_player/controller/api_controller.dart';
import 'package:music_player/controller/audiopalyer_controller.dart';
import 'package:music_player/view/authentication/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlayNowController()),
        ChangeNotifierProvider(
          create: (context) => ApiController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Gilroy",
        ),
        home: LoginScreen(),
      ),
    );
  }
}
