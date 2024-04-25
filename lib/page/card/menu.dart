import 'package:flutter/material.dart';
import '../deck/page.dart';

class menU {
  final BuildContext _context;
  final Function() _draw;

  menU({required BuildContext context, required Function() draw})
      : _context = context,
        _draw = draw;

  final List<dynamic> _menu = [
    Icons.arrow_back_rounded,
    'Card Info',
    Icons.filter_list_rounded,
  ];

  void _back() {
    Navigator.pushReplacement(
      _context,
      MaterialPageRoute(
        builder: (context) => decKpagE(),
      ),
    );
  }

  void _filter() {
    _draw();
  }

  List<dynamic> getMenu() => _menu;

  List<Function> getOnTap() {
    return [
      _back,
      () {},
      _filter,
    ];
  }
}
