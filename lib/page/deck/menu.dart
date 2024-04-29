import 'package:flutter/material.dart';
import 'package:project/service/deck.dart';
import '../card/page.dart';

class menU {
  final BuildContext _context;
  final decK _d = decK();
  final Function() _delete;
  final Function() _edit;
  final bool _onEdit;

  menU(
      {required BuildContext context,
      required Function() delete,
      required Function() edit,
      required bool onEdit})
      : _context = context,
        _delete = delete,
        _edit = edit,
        _onEdit = onEdit;

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

  void _draw() {}

  void _share() {}

  void _search() {
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

  void _add() {
    Navigator.pushReplacement(
      _context,
      MaterialPageRoute(
        builder: (context) => carDpagE(save: true),
      ),
    );
  }

  void _Edit() {
    _edit();
  }

  List<dynamic> getMenu() {
    return _onEdit ? _menuE : _menu;
  }

  List<Function> getOnTap() {
    return _onEdit
        ? [
            _Delete,
            () {},
            () {},
            _add,
            _Edit,
          ]
        : [
            _draw,
            _share,
            () {},
            _search,
            _Edit,
          ];
  }
}
