import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/api/model.dart';

class CardAPI {
  final String _baseUrl =
      "https://card-fight-vanguard-api.ue.r.appspot.com/api/v1/";

  Future<List<Model>> getData(String search, {int page = 1}) async {
    http.Response response =
        await http.get(Uri.parse(_baseUrl + "$search?page=$page"));
    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body)['data'];
        List<Model> fetchedData =
            jsonData.map((e) => Model.fromJson(e)).toList();
        switch (_baseUrl) {
          case 'https://card-fight-vanguard-api.ue.r.appspot.com/api/v1/':
            fetchedData.removeWhere((item) => item.getSets().length == 0);
            break;
          default:
            break;
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
