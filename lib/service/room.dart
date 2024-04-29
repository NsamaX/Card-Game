import 'package:flutter/material.dart';
import 'dart:math';
import 'package:project/page/duel.dart';

class rooms {
  final int _room;

  rooms({
    required int room,
  }) : _room = room;

  List<Map<String, dynamic>> generate() {
    List<Map<String, dynamic>> _data = [
      {"title": null, "content": []}
    ];
    List<IconData> statusIcon = [
      Icons.tag_faces_outlined,
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
        'page': duel(),
      });
    }
    return _data;
  }
}
