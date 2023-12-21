import 'package:flutter/material.dart';
import 'package:music_player/utils/color_constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: ConstantColors.themeBlueColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.themeBlueColor,
        iconTheme: IconThemeData(
          color: ConstantColors.themeWhiteColor,
        ),
        title: TextField(
          style: TextStyle(color: ConstantColors.themeWhiteColor),
          decoration: InputDecoration(
            hintText: "Artists, songs, or albums",
            hintStyle: TextStyle(color: ConstantColors.themeWhiteColor),
            prefixIcon: Icon(Icons.search),
            prefixIconColor: ConstantColors.themeWhiteColor,
          ),
        ),
      ),
    );
  }
}
