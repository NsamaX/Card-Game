import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/cfv.dart';

class ApiService {
  final String baseUrl =
      "https://card-fight-vanguard-api.ue.r.appspot.com/api/v1/";

  Future<List<CardData>> getData(String search, {int page = 1}) async {
    http.Response response =
        await http.get(Uri.parse(baseUrl + "$search?page=$page"));
    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body)['data'];
        List<CardData> fetchedData =
            jsonData.map((e) => CardData.fromJson(e)).toList();
        fetchedData.removeWhere((item) => item.sets.length == 0);
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