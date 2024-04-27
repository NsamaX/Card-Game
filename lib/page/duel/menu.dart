import 'package:flutter/material.dart';
import '../play/page.dart';

class menU {
  final BuildContext _context;
  final Function() _headphone;
  final bool _onHeadphone;
  final Function() _microphone;
  final bool _onMicrophone;
  final Function() _draw;

  menU({
    required BuildContext context,
    required Function() headphone,
    required bool onHeadphone,
    required Function() microphone,
    required bool onMicrophone,
    required Function() draw,
  })  : _context = context,
        _headphone = headphone,
        _onHeadphone = onHeadphone,
        _microphone = microphone,
        _onMicrophone = onMicrophone,
        _draw = draw;

  final List<dynamic> _menu = [
    Icons.arrow_back_rounded,
    null,
    'Room ID',
    null,
    Icons.chat_rounded,
  ];

  void _back() {
    Navigator.pushReplacement(
      _context,
      MaterialPageRoute(builder: (context) => plaYpagE()),
    );
  }

  void _head() {
    _headphone();
  }

  void _mic() {
    _microphone();
  }

  void _chat() {
    _draw();
  }

  List<dynamic> getMenu() {
    if (_onHeadphone)
      _menu[1] = Icons.headset_rounded;
    else
      _menu[1] = Icons.headset_off_rounded;
    if (_onMicrophone)
      _menu[3] = Icons.mic_rounded;
    else
      _menu[3] = Icons.mic_off_rounded;
    return _menu;
  }

  List<Function> getOnTap() {
    return [
      _back,
      _head,
      () {},
      _mic,
      _chat,
    ];
  }
}
