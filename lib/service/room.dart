import 'package:flutter/material.dart';
import 'dart:math';
import 'package:project/page/play.dart';

class Room {
  final int _room;

  Room({required int room}) : _room = room;

  List<Map<String, dynamic>> getRoom() {
    List<Map<String, dynamic>> _label = [
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
      if (_label.length <= i) _label.add({"title": null, "content": []});
      _label[i]['content'].add({
        'icon': status,
        'text': text,
        'page': PlayPage(),
      });
    }
    return _label;
  }
}
