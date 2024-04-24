import 'package:flutter/material.dart';
import '../play/page.dart';

class menU {
  final BuildContext _context;

  menU({required BuildContext context}) : _context = context;

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

  void _chat() {}

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
