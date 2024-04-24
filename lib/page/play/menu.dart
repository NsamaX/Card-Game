import 'package:flutter/material.dart';

class menU {
  final List<dynamic> _menu = [
    Icons.filter_list_rounded,
    'Play',
    Icons.add_rounded,
  ];

  void _filter() {}

  void _create() {}

  List<dynamic> getMenu() => _menu;

  List<Function> getOnTap() {
    return [
      _filter,
      () {},
      _create,
    ];
  }
}
