import 'package:flutter/material.dart';
import 'package:project/api/service/deck.dart';
import '../card/page.dart';

class menU {
  final BuildContext _context;
  final decK _d = decK();
  final Function() _delete;
  final Function() _edit;
  late bool _editMenu;

  menU(
      {required BuildContext context,
      required Function() delete,
      required Function() edit,
      required bool editMenu})
      : _context = context,
        _delete = delete,
        _edit = edit,
        _editMenu = editMenu;

  final List<dynamic> _menu = [
    Icons.menu_rounded,
    Icons.ios_share_rounded,
    'My Deck',
    Icons.search_rounded,
    'Edit',
  ];

  final List<dynamic> _menuE = [
    Icons.delete_rounded,
    null,
    'My Deck',
    Icons.add_rounded,
    'Done',
  ];

  void _Menu() {}

  void _Share() {}

  void _Search() {
    Navigator.pushReplacement(
      _context,
      MaterialPageRoute(
        builder: (context) => carDpagE(save: false),
      ),
    );
  }

  void _Delete() {
    _d.delete().then(
      (_) {
        ScaffoldMessenger.of(_context).showSnackBar(
          SnackBar(
            content: Text('Deleted deck successfully'),
          ),
        );
        _delete();
      },
    );
  }

  void _Add() {
    Navigator.pushReplacement(
      _context,
      MaterialPageRoute(
        builder: (context) => carDpagE(save: true),
      ),
    );
  }

  void _Edit() {
    _editMenu = !_editMenu;
    _edit();
  }

  List<dynamic> getMenu() {
    return _editMenu ? _menuE : _menu;
  }

  List<Function> getOnTap() {
    return _editMenu
        ? [
            _Delete,
            () {},
            () {},
            _Add,
            _Edit,
          ]
        : [
            _Menu,
            _Share,
            () {},
            _Search,
            _Edit,
          ];
  }
}
