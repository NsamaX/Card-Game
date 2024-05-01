import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'package:project/service/card.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/cardList.dart';
import 'package:project/widget/filterBox.dart';
import 'deck.dart';

class CardBookPage extends StatefulWidget {
  final bool _save;

  const CardBookPage({Key? key, required bool save})
      : _save = save,
        super(key: key);

  @override
  State<CardBookPage> createState() => _CardBookPageState();
}

class _CardBookPageState extends State<CardBookPage> {
  final ScrollController _scrollController = ScrollController();
  late List<Model> _card;

  final String _search = "cards";
  int _page = 1;
  bool _isLoading = false;

  bool _showFilter = false;
  final List<dynamic> _option = [
    [
      {
        'icon': Icons.search_rounded,
        'text': 'Search',
        'options': null,
      },
      {
        'icon': Icons.swap_vert_outlined,
        'text': 'Sort',
        'options': null,
      },
    ],
    [
      {
        'icon': null,
        'text': 'Clan',
        'options': null,
      },
      {
        'icon': null,
        'text': 'Nation',
        'options': null,
      },
      {
        'icon': null,
        'text': 'Type',
        'options': null,
      },
      {
        'icon': null,
        'text': 'Grade',
        'options': null,
      },
      {
        'icon': null,
        'text': 'Skill',
        'options': null,
      },
      {
        'icon': null,
        'text': 'Power',
        'options': null,
      },
      {
        'icon': null,
        'text': 'Shield',
        'options': null,
      },
    ],
    [
      {
        'icon': null,
        'text': 'Format',
        'options': null,
      },
      {
        'icon': null,
        'text': 'Set',
        'options': null,
      },
    ]
  ];

  void _back() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DeckPage()),
    );
  }

  void _filter() {
    setState(() {
      _showFilter = !_showFilter;
    });
  }

  Future<void> _getData(String search, {int page = 1}) async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });
    List<Model> fetchedData = await CardAPI().getData(search, page: page);
    if (!mounted) return;
    setState(() {
      if (page == 1)
        _card = fetchedData;
      else
        _card.addAll(fetchedData);
      _page = page;
      _isLoading = false;
    });
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange)
      _getData(_search, page: _page + 1);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _card = [];
    _getData(_search);
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        menu: [
          Icons.arrow_back_rounded,
          'Card Info',
          Icons.filter_list_rounded,
        ],
        onTap: [
          _back,
          () {},
          _filter,
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CardList(
              card: _card,
              scrollController: _scrollController,
              save: widget._save,
            ),
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            transform: Matrix4.translationValues(_showFilter ? 0 : 260, 0, 0),
            child: FilterBox(filter: _option),
          ),
        ],
      ),
    );
  }
}
