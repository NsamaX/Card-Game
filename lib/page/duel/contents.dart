import 'package:flutter/material.dart';
import 'package:project/api/service/message.dart';

class contenT {
  final List<dynamic> _field = [
    {
      0: {
        0: {
          'field': {'name': 'Special', 'type': 0},
          'action': [
            {'action': null, 'icon': Icons.search_rounded, 'onTap': () {}},
          ]
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
            {'action': null, 'icon': Icons.search_rounded, 'onTap': () {}},
          ]
        },
      },
    },
    {
      1: {
        0: {
          'field': {'name': 'Special', 'type': 0},
          'action': [
            {'action': 'load', 'icon': Icons.download_rounded, 'onTap': () {}},
            {'action': null, 'icon': Icons.search_rounded, 'onTap': () {}},
          ]
        },
        1: {
          'field': {'name': 'Card', 'type': 0},
          'action': [
            {
              'action': null,
              'icon': Icons.screen_rotation_alt_rounded,
              'onTap': () {}
            },
          ],
        },
        2: {
          'field': {'name': 'Card', 'type': 0},
          'action': [
            {
              'action': null,
              'icon': Icons.screen_rotation_alt_rounded,
              'onTap': () {}
            },
          ],
        },
        3: {
          'field': {'name': 'Card', 'type': 0},
          'action': [
            {
              'action': null,
              'icon': Icons.screen_rotation_alt_rounded,
              'onTap': () {}
            },
          ],
        },
        4: {
          'field': {'name': 'Main', 'type': 0},
          'action': [
            {'action': 'load', 'icon': Icons.download_rounded, 'onTap': () {}},
            {'action': null, 'icon': Icons.search_rounded, 'onTap': () {}},
            {
              'action': null,
              'icon': Icons.view_carousel_rounded,
              'onTap': () {}
            },
          ],
        },
      },
    },
    {
      2: {
        0: {
          'field': {'name': 'Damage', 'type': 1},
          'action': [],
        },
        1: {
          'field': {'name': 'Card', 'type': 0},
          'action': [
            {
              'action': null,
              'icon': Icons.screen_rotation_alt_rounded,
              'onTap': () {}
            },
          ],
        },
        2: {
          'field': {'name': 'Card', 'type': 0},
          'action': [
            {
              'action': null,
              'icon': Icons.screen_rotation_alt_rounded,
              'onTap': () {}
            },
          ],
        },
        3: {
          'field': {'name': 'Card', 'type': 0},
          'action': [
            {
              'action': null,
              'icon': Icons.screen_rotation_alt_rounded,
              'onTap': () {}
            },
          ],
        },
        4: {
          'field': {'name': 'Drop', 'type': 0},
          'action': [
            {'action': null, 'icon': Icons.search_rounded, 'onTap': () {}},
          ]
        },
      },
    },
  ];

  List<dynamic> _cloneFieldWithoutActions() {
    List<dynamic> clone = [];
    var reversedField = _field.reversed.toList();
    for (var item in reversedField) {
      Map<dynamic, dynamic> clonedItem = {};
      item.forEach((key, value) {
        Map<dynamic, dynamic> clonedSubItem = {};
        var keys = value.keys.toList();
        keys = keys.reversed.toList();
        keys.forEach((subKey) {
          clonedSubItem[subKey] = {
            'field': value[subKey]['field'],
            'action': [],
          };
        });
        clonedItem[key] = clonedSubItem;
      });
      clone.add(clonedItem);
    }
    return clone;
  }

  List<dynamic> getField() {
    List<dynamic> clone = _cloneFieldWithoutActions();
    clone.addAll(_field);
    return clone;
  }

  final messagE _m = messagE();
  List<dynamic> getMessage() => _m.getMessage();
}
