import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_player/controller/api_controller.dart';
import 'package:music_player/controller/audiopalyer_controller.dart';
import 'package:music_player/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBoPcKOFidHVxfkgxyasFwa0RLL6Gx-6YY",
          appId: "1:459007089580:android:b8e7cf1344b4c41a863809",
          messagingSenderId: "",
          projectId: "museflow-music-player",
          storageBucket: "museflow-music-player.appspot.com"));

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
        home: HomeScreen(),
      ),
    );
  }
}
