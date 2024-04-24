import 'package:flutter/material.dart';
import 'package:project/api/service/deck.dart';
import '../card/page.dart';

class menU {
  final BuildContext _context;
  final decK _d = decK();
  final Function() _delete;
  final Function() _edit;

  menU(
      {required BuildContext context,
      required Function() delete,
      required Function() edit})
      : _context = context,
        _delete = delete,
        _edit = edit;

  final List<dynamic> _menu = [
    Icons.ios_share_rounded,
    Icons.delete_rounded,
    'My Deck',
    Icons.add_rounded,
    'Edit',
  ];

  void _Share() {}

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
    _edit();
  }

  List<dynamic> getMenu() => _menu;

  List<Function> getOnTap() {
    return [
      _Share,
      _Delete,
      () {},
      _Add,
      _Edit,
    ];
  }
}
