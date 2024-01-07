import 'package:flutter/material.dart';
import 'package:music_player/controller/search_controller.dart';
import 'package:music_player/utils/color_constants.dart';
import 'package:music_player/utils/image_constants.dart';
import 'package:music_player/view/search_screen/widget/searchList_tile.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    Provider.of<SearchControllerProvider>(context, listen: false)
        .fetchDeviceSongs();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchControllerProvider>(context);
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
            hintText: "Artists or songs",
            hintStyle: TextStyle(color: ConstantColors.themeWhiteColor),
            prefixIcon: Icon(Icons.search),
            prefixIconColor: ConstantColors.themeWhiteColor,
          ),
          onChanged: (value) =>
              Provider.of<SearchControllerProvider>(context, listen: false)
                  .seachList(value),
        ),
      ),
      body: ListView.separated(
        itemCount: searchProvider.seachListsongs.length,
        itemBuilder: (context, index) => SearchListTile(
          songTitle: searchProvider.seachListsongs[index].displayName,
          artist: searchProvider.seachListsongs[index].artist,
          image: QueryArtworkWidget(
            id: searchProvider.seachListsongs[index].id,
            type: ArtworkType.AUDIO,
            keepOldArtwork: true,
            artworkBorder: BorderRadius.circular(10),
            nullArtworkWidget: Image.asset(ConstantImage.mainLogoPng),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
