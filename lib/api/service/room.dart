import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project/page/duel/page.dart';

class Room {
  final int maxRoom;
  final int maxRoomPerPage;
  final int maxPageIcon;

  Room({
    required this.maxRoom,
    required this.maxRoomPerPage,
    required this.maxPageIcon,
  });

  List<Map<String, dynamic>> generateRoomsList() {
    List<Map<String, dynamic>> rooms = [
      {"topic": null, "label": []}
    ];
    List<IconData> possibleIcons = [
      Icons.face_unlock_rounded,
      Icons.public_rounded,
      Icons.lock_rounded,
    ];

    Random random = Random();
    for (int i = 0; i < maxRoom; i++) {
      IconData randomIcon = possibleIcons[random.nextInt(possibleIcons.length)];
      String roomID = 'Room ${i + 1}';
      String roomTopic = '$roomID : Player name : Game information';
      if (rooms.length <= i) {
        rooms.add({"topic": null, "label": []});
      }
      rooms[i]['label'].add({
        'topic': roomTopic,
        'icon': randomIcon,
        'page': DuelPage(),
      });
    }

    return rooms;
  }
}
