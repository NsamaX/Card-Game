import 'package:flutter/material.dart';

class board {
  final List<dynamic> _field = [
    [
      {
        'field': {'name': 'Special\nZone', 'type': 0},
        'action': []
      },
      {
        'field': {'name': 'Trigger', 'type': 0},
        'action': [],
      },
      {
        'field': {'name': 'Guard', 'type': 3},
        'action': [],
      },
      {
        'field': {'name': 'Show', 'type': 0},
        'action': [],
      },
      {
        'field': {'name': 'Bind\nZone', 'type': 0},
        'action': []
      },
    ],
    [
      {
        'field': {'name': 'Special\nDeck', 'type': 0},
        'action': [
          'load',
          'search',
          'use',
        ]
      },
      {
        'field': {'name': 'Card', 'type': 0},
        'action': [
          'block',
          'flip',
          'rotateX',
          'rotateY',
          'guard',
          'bin',
          'search',
        ],
      },
      {
        'field': {'name': 'Card', 'type': 0},
        'action': [
          'block',
          'flip',
          'rotateX',
          'rotateY',
          'guard',
          'bin',
          'search',
        ],
      },
      {
        'field': {'name': 'Card', 'type': 0},
        'action': [
          'block',
          'flip',
          'rotateX',
          'rotateY',
          'guard',
          'bin',
          'search',
        ],
      },
      {
        'field': {'name': 'Main\nDeck', 'type': 0},
        'action': [
          'load',
          'search',
          'shuffle',
          'draw',
          'bin',
        ],
      },
    ],
    [
      {
        'field': {'name': 'Damage', 'type': 3},
        'action': [
          'search',
          'damage',
          'stack',
          'bin',
        ],
      },
      {
        'field': {'name': 'Card', 'type': 0},
        'action': [
          'block',
          'flip',
          'rotateX',
          'rotateY',
          'guard',
          'bin',
          'search',
        ],
      },
      {
        'field': {'name': 'Card', 'type': 0},
        'action': [
          'block',
          'flip',
          'rotateX',
          'rotateY',
          'guard',
          'bin',
          'search',
        ],
      },
      {
        'field': {'name': 'Card', 'type': 0},
        'action': [
          'block',
          'flip',
          'rotateX',
          'rotateY',
          'guard',
          'bin',
          'search',
        ],
      },
      {
        'field': {'name': 'Drop', 'type': 0},
        'action': [
          'search',
        ]
      },
    ],
  ];

  final List<dynamic> _actions = [
    {
      'action': 'bin',
      'icon': Icons.delete_outline_rounded,
    },
    {
      'action': 'block',
      'icon': Icons.block_rounded,
    },
    {
      'action': 'damage',
      'icon': Icons.heart_broken_rounded,
    },
    {
      'action': 'draw',
      'icon': Icons.back_hand_rounded,
    },
    {
      'action': 'flip',
      'icon': Icons.screen_rotation_alt_rounded,
    },
    {
      'action': 'guard',
      'icon': Icons.shield_rounded,
    },
    {
      'action': 'load',
      'icon': Icons.download_rounded,
    },
    {
      'action': 'rotateX',
      'icon': Icons.stay_current_landscape_rounded,
    },
    {
      'action': 'rotateY',
      'icon': Icons.stay_current_portrait_rounded,
    },
    {
      'action': 'search',
      'icon': Icons.search_rounded,
    },
    {
      'action': 'shuffle',
      'icon': Icons.cached_rounded,
    },
    {
      'action': 'stack',
      'icon': Icons.copy_rounded,
    },
    {
      'action': 'use',
      'icon': Icons.style_rounded,
    },
  ];

  List<dynamic> _cloneFieldWithoutActions() {
    List<dynamic> _cloneField = [];
    for (int col = _field.length - 1; col >= 0; col--) {
      List<dynamic> _column = [];
      for (int row = _field[col].length - 1; row >= 0; row--) {
        Map<String, dynamic> _row = {
          'field': {
            'name': _field[col][row]['field']['name'],
            'type': (() {
              switch (_field[col][row]['field']['type']) {
                case 0:
                  return 2;
                case 1:
                  return 3;
                case 2:
                  return 0;
                case 3:
                  return 1;
                default:
                  return -1;
              }
            })(),
          },
          'action': [],
        };
        _column.add(_row);
      }
      _cloneField.add(_column);
    }
    return _cloneField;
  }

  List<dynamic> _setFieldActions() {
    List<dynamic> _fieldset = _field;
    for (int col = 0; col < _fieldset.length; col++) {
      for (int row = 0; row < _fieldset[col].length; row++) {
        List<dynamic> _row = [];
        for (int i = 0; i < _fieldset[col][row]['action'].length; i++) {
          for (var action in _actions) {
            if (_fieldset[col][row]['action'][i] == action['action']) {
              Map<String, dynamic> actionCopy = {
                'action': action['action'],
                'icon': action['icon'],
                'show': true,
              };
              _row.add(actionCopy);
            }
          }
        }
        _fieldset[col][row]['action'] = _row;
      }
    }
    return _fieldset;
  }

  List<dynamic> getField() {
    List<dynamic> _board = _cloneFieldWithoutActions();
    _board.addAll(_setFieldActions());
    return _board;
  }
}
