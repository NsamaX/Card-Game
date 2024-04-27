import 'package:flutter/material.dart';

class menU {
  final List<dynamic> _menu = [
    Icons.add_rounded,
    'Play',
    Icons.filter_list_rounded,
  ];

  void _filter() {}

  void _create() {}

  List<dynamic> getMenu() => _menu;

  List<Function> getOnTap() {
    return [
      _create,
      () {},
      _filter,
    ];
  }
}
