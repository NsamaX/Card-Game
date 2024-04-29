import 'package:flutter/material.dart';
import 'package:project/api/service/message.dart';

class contenT {
  final List<dynamic> _field = [
    [
      {
        'field': {'name': 'Special', 'type': 0},
        'action': [
          {
            'action': null,
            'icon': Icons.search_rounded,
          },
        ]
      },
      {
        'field': {'name': 'Trigger', 'type': 0},
        'action': [],
      },
      {
        'field': {'name': 'Guard', 'type': 1},
        'action': [],
      },
      {
        'field': {'name': 'Show', 'type': 0},
        'action': [],
      },
      {
        'field': {'name': 'Bind', 'type': 0},
        'action': [
          {
            'action': null,
            'icon': Icons.search_rounded,
          },
        ]
      },
    ],
    [
      {
        'field': {'name': 'Special', 'type': 0},
        'action': [
          {
            'action': null,
            'icon': Icons.search_rounded,
          },
          {
            'action': 'load',
            'icon': Icons.download_rounded,
          },
        ]
      },
      {
        'field': {'name': 'Card', 'type': 0},
        'action': [
          {
            'action': null,
            'icon': Icons.screen_rotation_alt_rounded,
          },
        ],
      },
      {
        'field': {'name': 'Card', 'type': 0},
        'action': [
          {
            'action': null,
            'icon': Icons.screen_rotation_alt_rounded,
          },
        ],
      },
      {
        'field': {'name': 'Card', 'type': 0},
        'action': [
          {
            'action': null,
            'icon': Icons.screen_rotation_alt_rounded,
          },
        ],
      },
      {
        'field': {'name': 'Main', 'type': 0},
        'action': [
          {
            'action': null,
            'icon': Icons.search_rounded,
          },
          {
            'action': 'load',
            'icon': Icons.download_rounded,
          },
        ],
      },
    ],
    [
      {
        'field': {'name': 'Damage', 'type': 1},
        'action': [],
      },
      {
        'field': {'name': 'Card', 'type': 0},
        'action': [
          {
            'action': null,
            'icon': Icons.screen_rotation_alt_rounded,
          },
        ],
      },
      {
        'field': {'name': 'Card', 'type': 0},
        'action': [
          {
            'action': null,
            'icon': Icons.screen_rotation_alt_rounded,
          },
        ],
      },
      {
        'field': {'name': 'Card', 'type': 0},
        'action': [
          {
            'action': null,
            'icon': Icons.screen_rotation_alt_rounded,
          },
        ],
      },
      {
        'field': {'name': 'Drop', 'type': 0},
        'action': [
          {
            'action': null,
            'icon': Icons.search_rounded,
          },
        ]
      },
    ],
  ];

  List<dynamic> _cloneFieldWithoutActions() {
    List<dynamic> clone = [];
    for (int col = _field.length - 1; col >= 0; col--) {
      List<dynamic> _column = [];
      for (int row = _field[col].length - 1; row >= 0; row--) {
        Map<String, dynamic> _row = {};
        _row = {
          'field': _field[col][row]['field'],
          'action': [],
        };
        _column.add(_row);
      }
      clone.add(_column);
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
