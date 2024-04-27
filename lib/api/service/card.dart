import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/cfv.dart';

class carD {
  final String baseUrl =
      "https://card-fight-vanguard-api.ue.r.appspot.com/api/v1/";

  Future<List<carDdatA>> getData(String search, {int page = 1}) async {
    http.Response response =
        await http.get(Uri.parse(baseUrl + "$search?page=$page"));
    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body)['data'];
        List<carDdatA> fetchedData =
            jsonData.map((e) => carDdatA.fromJson(e)).toList();
        switch (baseUrl) {
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
