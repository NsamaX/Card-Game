import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/cfv.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<void> getData({
    required String search,
    int page = 1,
    required Function(List<CardData>, int) updateCardData,
  }) async {
    http.Response response =
        await http.get(Uri.parse(baseUrl + "$search?page=$page"));
    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body)['data'];
        List<CardData> fetchedData =
            jsonData.map((e) => CardData.fromJson(e)).toList();
        fetchedData.removeWhere((item) => item.sets.length == 0);
        updateCardData(fetchedData, page);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
