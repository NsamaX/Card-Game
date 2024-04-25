import 'package:flutter/material.dart';
import '../play/page.dart';

class menU {
  final BuildContext _context;
  final Function() _draw;

  menU({required BuildContext context, required Function() draw})
      : _context = context,
        _draw = draw;

  final List<dynamic> _menu = [
    Icons.arrow_back_rounded,
    Icons.headphones_rounded,
    'Room ID',
    Icons.mic_rounded,
    Icons.chat_rounded,
  ];

  void _back() {
    Navigator.pushReplacement(
      _context,
      MaterialPageRoute(builder: (context) => plaYpagE()),
    );
  }

  void _voice() {}

  void _mic() {}

  void _chat() {
    _draw();
  }

  List<dynamic> getMenu() => _menu;

  List<Function> getOnTap() {
    return [
      _back,
      _voice,
      () {},
      _mic,
      _chat,
    ];
  }
}
