import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_player/controller/audiopalyer_controller.dart';
import 'package:music_player/controller/search_controller.dart';
import 'package:music_player/view/splash_screen/splash_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "player",
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
    return FutureBuilder(
      future: checkPermission(),
      builder: (context, snapshot) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => PlayNowController()),
            ChangeNotifierProvider(
                create: (context) => SearchControllerProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Gilroy",
            ),
            home: SplashScreen(),
          ),
        );
      },
    );
  }

  checkPermission() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
    } else {
      checkPermission();
    }
  }
}
