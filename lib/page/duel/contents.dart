import 'package:flutter/material.dart';

class contenT {
  final List<Map<int, dynamic>> _field = [
    {
      0: {
        0: {
          'field': {'name': 'Special', 'type': 0},
          'action': [
            {Icons.search_rounded: () {}},
          ],
        },
        1: {
          'field': {'name': 'Trigger', 'type': 0},
          'action': [],
        },
        2: {
          'field': {'name': 'Guard', 'type': 1},
          'action': [],
        },
        3: {
          'field': {'name': 'Show', 'type': 0},
          'action': [],
        },
        4: {
          'field': {'name': 'Bind', 'type': 0},
          'action': [
            {Icons.search_rounded: () {}},
          ],
        },
      },
      1: {
        0: {
          'field': {'name': 'Special', 'type': 0},
          'action': [
            {Icons.search_rounded: () {}},
          ],
        },
        1: {
          'field': {'name': 'Card', 'type': 0},
          'action': [
            {Icons.screen_rotation_alt_rounded: () {}},
          ],
        },
        2: {
          'field': {'name': 'Card', 'type': 0},
          'action': [
            {Icons.screen_rotation_alt_rounded: () {}},
          ],
        },
        3: {
          'field': {'name': 'Card', 'type': 0},
          'action': [
            {Icons.screen_rotation_alt_rounded: () {}},
          ],
        },
        4: {
          'field': {'name': 'Main', 'type': 0},
          'action': [
            {Icons.search_rounded: () {}},
            {Icons.view_carousel_rounded: () {}},
          ],
        },
      },
      2: {
        0: {
          'field': {'name': 'Damage', 'type': 1},
          'action': [],
        },
        1: {
          'field': {'name': 'Card', 'type': 0},
          'action': [
            {Icons.screen_rotation_alt_rounded: () {}},
          ],
        },
        2: {
          'field': {'name': 'Card', 'type': 0},
          'action': [
            {Icons.screen_rotation_alt_rounded: () {}},
          ],
        },
        3: {
          'field': {'name': 'Card', 'type': 0},
          'action': [
            {Icons.screen_rotation_alt_rounded: () {}},
          ],
        },
        4: {
          'field': {'name': 'Drop', 'type': 0},
          'action': [
            {Icons.search_rounded: () {}},
          ],
        },
      },
    },
  ];

  List<Map<int, dynamic>> _cloneFieldWithoutActions() {
    List<Map<int, dynamic>> clonedField = [];

    for (var map in _field) {
      Map<int, dynamic> clonedMap = {};
      var reversedKeys = map.keys.toList().reversed.toList();

      for (var key in reversedKeys) {
        Map<int, dynamic> clonedRow = {};
        for (int i = map[key].length - 1; i >= 0; i--) {
          int index = map[key].keys.elementAt(i);
          Map<String, dynamic> clonedField = {
            'field': map[key][index]['field'],
            'action': [],
          };
          clonedRow[index] = clonedField;
        }
        clonedMap[key] = clonedRow;
      }
      clonedField.add(clonedMap);
    }

    return clonedField;
  }

  List<Map<int, dynamic>> getField() {
    List<Map<int, dynamic>> clonedField = _cloneFieldWithoutActions();
    clonedField.addAll(_field);
    return clonedField;
  }
}
