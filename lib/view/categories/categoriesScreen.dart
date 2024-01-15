import 'package:flutter/material.dart';
import 'package:music_player/controller/playlist_controller.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/view/categories/play_list_screen/play_list_screen.dart';
import 'package:music_player/view/categories/widgets/category_container.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plalistProvider = Provider.of<PlaylistController>(context);
    final kHeight5 = SizedBox(height: 5);
    return Scaffold(
      backgroundColor: ConstantColors.themeBlueColor,
      appBar: AppBar(
        title: Text("Categories"),
        titleTextStyle: TextStyle(
            fontFamily: "Gilroy",
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: ConstantColors.themeWhiteColor),
        backgroundColor: ConstantColors.themeBlueColor,
        elevation: 0,
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 200),
        children: [
          CategoryContainer(
              name: "Playlists",
              count: "${plalistProvider.playlists.length} playlists",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlayListScreen()));
              }),
        ],
      ),
    );
  }
}