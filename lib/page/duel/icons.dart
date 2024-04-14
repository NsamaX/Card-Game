import 'package:flutter/material.dart';
import '../play/page.dart';

final List<dynamic> menus = [
  Icons.arrow_back_ios_new_rounded,
  Icons.headphones_rounded,
  'Room ID',
  Icons.mic_rounded,
  Icons.chat_rounded,
];

List<Function> getOnTap(BuildContext context) {
  return [
    () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PlayPage()),
      );
    },
    () {},
    () {},
  ];
}
