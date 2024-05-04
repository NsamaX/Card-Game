import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/api/model/cfv.dart';

class CardService {
  final String game;
  late final String baseUrl;

  CardService({required String game}) : game = game {
    switch (game) {
      case 'cfv':
        baseUrl = "https://card-fight-vanguard-api.ue.r.appspot.com/api/v1/";
        break;
      default:
        throw ArgumentError('Unsupported game: $game');
    }
  }

  Future<List<Model>> getData(String search, int page) async {
    http.Response response =
        await http.get(Uri.parse(baseUrl + "$search?page=$page"));
    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body)['data'];
        List<Model> fetchedData =
            jsonData.map((e) => Model.fromJson(e)).toList();
        if (game == 'cfv')
          fetchedData.removeWhere((item) => item.getSets().isEmpty);
        return fetchedData;
      } else
        throw Exception('Failed to load data: ${response.statusCode}');
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
