import 'package:flutter/material.dart';

class Field {
  final List<dynamic> _field = [
    [
      {
        'field': {'name': 'Special\nZone', 'type': 0, 'event': 'special'},
        'action': []
      },
      {
        'field': {'name': 'Trigger', 'type': 0, 'event': 'trigger'},
        'action': [],
      },
      {
        'field': {'name': 'Guard', 'type': 3, 'event': 'guard'},
        'action': [
          'drop',
        ],
      },
      {
        'field': {'name': 'Show', 'type': 0, 'event': 'show'},
        'action': [],
      },
      {
        'field': {'name': 'Bind\nZone', 'type': 0, 'event': 'bind'},
        'action': []
      },
    ],
    [
      {
        'field': {'name': 'Special\nDeck', 'type': 0},
        'action': [
          'load',
          'search',
          'special',
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
          'drop',
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
          'drop',
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
          'drop',
          'search',
        ],
      },
      {
        'field': {'name': 'Main\nDeck', 'type': 0},
        'action': [
          'load',
          'search',
          'shuffle',
          'show',
          'drop',
          'damage',
          'draw',
        ],
      },
    ],
    [
      {
        'field': {'name': 'Damage\nZone', 'type': 3, 'event': 'damage'},
        'action': [
          'search',
          'drop',
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
          'drop',
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
          'drop',
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
          'drop',
          'search',
        ],
      },
      {
        'field': {'name': 'Drop\nZone', 'type': 0, 'event': 'drop'},
        'action': [
          'search',
        ]
      },
    ],
  ];

  final List<dynamic> _action = [
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
      'action': 'drop',
      'icon': Icons.delete_outline_rounded,
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
      'action': 'show',
      'icon': Icons.style_rounded,
    },
    {
      'action': 'shuffle',
      'icon': Icons.cached_rounded,
    },
    {
      'action': 'special',
      'icon': Icons.copy_rounded,
    },
  ];

  List<dynamic> _cloneFieldWithoutAction() {
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

  List<dynamic> _setFieldAction() {
    List<dynamic> _fieldset = _field;
    for (int col = 0; col < _fieldset.length; col++) {
      for (int row = 0; row < _fieldset[col].length; row++) {
        List<dynamic> _row = [];
        for (int i = 0; i < _fieldset[col][row]['action'].length; i++) {
          for (var move in _action) {
            if (_fieldset[col][row]['action'][i] == move['action']) {
              Map<String, dynamic> actionCopy = {
                'action': move['action'],
                'icon': move['icon'],
                'show': move['action'] == 'load' ? true : false,
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
    List<dynamic> _board = _cloneFieldWithoutAction();
    _board.addAll(_setFieldAction());
    return _board;
  }
}
