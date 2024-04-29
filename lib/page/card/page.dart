import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'package:project/service/card.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/filter.dart';
import 'package:project/widget/list.dart';
import 'content.dart';
import 'menu.dart';

class carDpagE extends StatefulWidget {
  final bool save;

  const carDpagE({Key? key, required this.save}) : super(key: key);

  @override
  State<carDpagE> createState() => _carDpagEState();
}

class _carDpagEState extends State<carDpagE> {
  final ScrollController _scrollController = ScrollController();
  final card _api = card();
  final String _search = "cards";

  int _page = 1;
  List<model> _card = [];
  bool _isLoading = false;

  Future<void> _getData(String search, {int page = 1}) async {
    if (!mounted) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    List<model> fetchedData = await _api.getData(search, page: page);
    if (!mounted) {
      return;
    }

    setState(() {
      if (page == 1) {
        _card = fetchedData;
      } else {
        _card.addAll(fetchedData);
      }
      _page = page;
      _isLoading = false;
    });
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _getData(_search, page: _page + 1);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getData(_search);
    _scrollController.addListener(_scrollListener);
  }

  bool _show = false;

  void _draw() {
    setState(() {
      _show = !_show;
    });
  }

  @override
  Widget build(BuildContext context) {
    contenT _c = contenT();
    menU _m = menU(context: context, draw: _draw);

    return Scaffold(
      appBar: appBar(menu: _m.getMenu(), onTap: _m.getOnTap()),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: list(
              card: _card,
              scrollController: _scrollController,
              build: widget.save,
            ),
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            transform: Matrix4.translationValues(_show ? 0 : 260, 0, 0),
            child: filter(filter: _c.getFilter()),
          ),
        ],
      ),
    );
  }
}
