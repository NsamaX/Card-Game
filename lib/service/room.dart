// TODO: set filter
// TODO: get filter & room by API

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:project/page/play.dart';

class RoomService {
  final List<dynamic> filter = [
    [
      {
        'icon': null,
        'text': '?',
        'options': null,
      },
      {
        'icon': null,
        'text': '?',
        'options': null,
      },
    ],
  ];

  List<dynamic> getFilter() => filter;

  List<dynamic> getRoom() {
    List<dynamic> label = [
      {"title": null, "content": []}
    ];
    List<IconData> statusIcon = [
      Icons.tag_faces_outlined,
      Icons.public_rounded,
      Icons.lock_rounded,
    ];
    List<String> formats = [
      // 'Limit Break',
      // 'Break Ride',
      // 'Legion',
      'G',
      // 'V',
      // 'D',
    ];
    Random random = Random();
    for (int i = 0; i < 260; i++) {
      IconData status = statusIcon[random.nextInt(statusIcon.length)];
      String format = formats[random.nextInt(formats.length)];
      String text = 'Room ${i + 1} Format ${format}';
      if (label.length <= i) label.add({"title": null, "content": []});
      label[i]['content'].add({
        'icon': status,
        'text': text,
        'page': PlayPage(roomID: i + 1, game: 'cfv', format: format),
      });
    }
    return label;
  }
}
