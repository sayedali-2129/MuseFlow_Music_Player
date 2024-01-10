import 'package:flutter/material.dart';
import 'package:music_player/utils/color_constants.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.themeBlueColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ConstantColors.themeWhiteColor),
        backgroundColor: ConstantColors.themeBlueColor,
        titleSpacing: 0,
        title: Text(
          "Your PlayLists",
          style: TextStyle(
              color: ConstantColors.themeWhiteColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: ConstantColors.themeWhiteColor)),
              title: Text(
                "New Playlist",
                style: TextStyle(color: ConstantColors.themeWhiteColor),
              ),
              content: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      hintText: "Playlist Name",
                      hintStyle:
                          TextStyle(color: ConstantColors.themeWhiteColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ConstantColors.themeWhiteColor))),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: Text("Create",
                        style:
                            TextStyle(color: ConstantColors.themeWhiteColor))),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel",
                        style:
                            TextStyle(color: ConstantColors.themeWhiteColor)))
              ],
            ),
          );
        },
        backgroundColor: ConstantColors.themeWhiteColor,
        child: Icon(
          Icons.add,
          color: ConstantColors.themeBlueColor,
        ),
      ),
    );
  }
}
