import 'package:flutter/material.dart';
import 'package:music_player/controller/albumController.dart';
import 'package:music_player/controller/artistController.dart';
import 'package:music_player/controller/audiopalyer_controller.dart';
import 'package:music_player/controller/genre_controller.dart';
import 'package:music_player/controller/playlist_controller.dart';
import 'package:music_player/controller/search_controller.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/view/splash_screen/splash_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

void main() {
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
            ChangeNotifierProvider(create: (context) => PlaylistController()),
            ChangeNotifierProvider(create: (context) => AlbumController()),
            ChangeNotifierProvider(create: (context) => ArtistController()),
            ChangeNotifierProvider(create: (context) => GenreController()),
          ],
          child: MaterialApp(
            // scaffoldMessengerKey: ErrorMessage.messengerKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              iconTheme: IconThemeData(color: ConstantColors.themeWhiteColor),
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
