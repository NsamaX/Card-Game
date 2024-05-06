import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/api/model/factory.dart';
import 'package:project/api/model/model.dart';

class CardService {
  final String game;
  late String baseUrl;

  CardService({required String game}) : game = game {
    switch (game) {
      case 'cfv':
        baseUrl = "https://card-fight-vanguard-api.ue.r.appspot.com/api/v1/";
        break;
      default:
        throw ArgumentError('Unsupported game: $game');
    }
  }

  Future<List<Model>> getData(
      {required String game, required String search, required int page}) async {
    baseUrl += search;
    switch (game) {
      case 'cfv':
        baseUrl += "?page=$page";
    }
    http.Response response = await http.get(Uri.parse(baseUrl));
    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body)['data'];
        List<Model> fetchedData = [];
        fetchedData = jsonData
            .map((e) => Factory().game(game: game).fromJson(json: e))
            .toList();
        switch (game) {
          case 'cfv':
            fetchedData
                .removeWhere((item) => item.getMap()['Sets'] == 'No Set');
            break;
          default:
            throw ArgumentError('Unsupported game: $game');
        }
        return fetchedData;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
