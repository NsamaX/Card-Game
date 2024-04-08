import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/api/model/cfv.dart';
import 'package:project/widget/app_bar.dart';
import 'package:project/widget/buttom_nav.dart';
import 'package:project/widget/card/list.dart';
import 'icons.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        icons: icons,
        onTapCallbacks: getOnTapCallbacks(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CardList(
          cardDataList: _CardData,
          scrollController: _scrollController,
          buildDeck: false,
        ),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 2),
    );
  }

  final baseUrl = "https://card-fight-vanguard-api.ue.r.appspot.com/api/v1/";
  final card = "card";
  final cards = "cards";
  final sets = "sets";

  List<CardData> _CardData = [];
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _getData(cards);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _getData(cards, page: _page + 1);
    }
  }

  Future<void> _getData(String search, {int page = 1}) async {
    http.Response response =
        await http.get(Uri.parse(baseUrl + "$search?page=$page"));
    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body)['data'];
        List<CardData> fetchedData =
            jsonData.map((e) => CardData.fromJson(e)).toList();
        fetchedData.removeWhere((item) => item.sets.length == 0);
        setState(() {
          if (page == 1) {
            _CardData = fetchedData;
          } else {
            _CardData.addAll(fetchedData);
          }
          _page = page;
        });
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
