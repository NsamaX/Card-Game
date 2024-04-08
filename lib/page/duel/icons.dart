import 'package:flutter/material.dart';
import '../play/page.dart';

final List<dynamic> icons = [
  Icons.arrow_back_ios_new_rounded,
  Icons.chat_rounded,
  'Room ID',
  Icons.mic_rounded,
  Icons.headphones_rounded,
];

List<Function> getOnTapCallbacks(BuildContext context) {
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
