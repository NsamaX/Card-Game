import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project/page/duel/page.dart';

class rooM {
  final int _room;

  rooM({
    required int room,
  }) : _room = room;

  List<Map<String, dynamic>> generate() {
    List<Map<String, dynamic>> _data = [
      {"title": null, "content": []}
    ];
    List<IconData> statusIcon = [
      Icons.face_unlock_rounded,
      Icons.public_rounded,
      Icons.lock_rounded,
    ];

    Random random = Random();
    for (int i = 0; i < _room; i++) {
      IconData status = statusIcon[random.nextInt(statusIcon.length)];
      String text = 'Room ${i + 1} : Player name : Game information';
      if (_data.length <= i) {
        _data.add({"title": null, "content": []});
      }
      _data[i]['content'].add({
        'icon': status,
        'text': text,
        'page': dueLpagE(),
      });
    }

    return _data;
  }
}
