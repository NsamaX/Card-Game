import 'package:flutter/material.dart';
import '../deck/page.dart';

class menU {
  final BuildContext _context;

  menU({
    required BuildContext context,
  }) : _context = context;

  final List<dynamic> _menu = [
    Icons.arrow_back_ios_new_rounded,
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

  void _filter() {}

  List<dynamic> getMenu() => _menu;

  List<Function> getOnTap() {
    return [
      _back,
      () {},
      _filter,
    ];
  }
}
