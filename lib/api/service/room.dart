import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project/page/duel/page.dart';

class Room {
  final int room;
  final int page;
  final int icon;

  Room({
    required this.room,
    required this.page,
    required this.icon,
  });

  List<Map<String, dynamic>> generateRoomsList() {
    List<Map<String, dynamic>> rooms = [
      {"topic": null, "content": []}
    ];
    List<IconData> icons = [
      Icons.face_unlock_rounded,
      Icons.public_rounded,
      Icons.lock_rounded,
    ];

    Random random = Random();
    for (int i = 0; i < room; i++) {
      IconData randomIcon = icons[random.nextInt(icons.length)];
      String id = 'Room ${i + 1}';
      String label = '$id : Player name : Game information';
      if (rooms.length <= i) {
        rooms.add({"topic": null, "content": []});
      }
      rooms[i]['content'].add({
        'icon': randomIcon,
        'label': label,
        'page': DuelPage(),
      });
    }

    return rooms;
  }
}
