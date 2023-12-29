import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_player/model/music_api_model.dart';

class ApiController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  MusicApiModel musicApiResponce = MusicApiModel();

  Future fetchData() async {
    final url = Uri.parse("https://storage.googleapis.com/uamp/catalog.json");

    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      musicApiResponce = MusicApiModel.fromJson(decodedData);

      notifyListeners();
    } else {
      print("API failed");
    }
  }
}
