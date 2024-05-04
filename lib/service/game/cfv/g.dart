// TODO: set game play
// TODO: get game play by API

import 'package:flutter/material.dart';
import 'package:project/service/board/format.dart';

class G implements Format {
  final List<dynamic> _field = [
    [
      {
        'field': {
          'name': 'Special\nZone',
          'type': 0,
          'event': 'special',
        },
        'action': [
          'search',
        ]
      },
      {
        'field': {
          'name': 'Trigger',
          'type': 0,
          'event': 'trigger',
        },
        'action': [
          'search',
          'draw',
        ],
      },
      {
        'field': {
          'name': 'Guard',
          'type': 3,
          'event': 'guard',
        },
        'action': [
          'search',
          'drop',
        ],
      },
      {
        'field': {
          'name': 'Show',
          'type': 0,
          'event': 'show',
        },
        'action': [
          'search',
          'flip',
          'draw',
        ],
      },
      {
        'field': {
          'name': 'Bind\nZone',
          'type': 0,
          'event': 'bind',
        },
        'action': [
          'search',
        ]
      },
    ],
    [
      {
        'field': {
          'name': 'Special\nDeck',
          'type': 0,
        },
        'action': [
          'load',
          'search',
        ]
      },
      {
        'field': {
          'name': 'Card',
          'type': 0,
        },
        'action': [
          'search',
          'flip',
          'guard',
        ],
      },
      {
        'field': {
          'name': 'Card',
          'type': 0,
        },
        'action': [
          'search',
          'flip',
          'special',
        ],
      },
      {
        'field': {
          'name': 'Card',
          'type': 0,
        },
        'action': [
          'search',
          'flip',
          'guard',
        ],
      },
      {
        'field': {
          'name': 'Main\nDeck',
          'type': 0,
        },
        'action': [
          'load',
          'search',
          'shuffle',
          'show',
          'draw',
          'drop',
          'damage',
          'swap',
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
        'field': {
          'name': 'Card',
          'type': 0,
        },
        'action': [
          'search',
          'flip',
        ],
      },
      {
        'field': {
          'name': 'Card',
          'type': 0,
        },
        'action': [
          'search',
          'flip',
        ],
      },
      {
        'field': {'name': 'Card', 'type': 0},
        'action': [
          'search',
          'flip',
        ],
      },
      {
        'field': {
          'name': 'Drop\nZone',
          'type': 0,
          'event': 'drop',
        },
        'action': [
          'search',
        ]
      },
    ],
  ];

  final Map<String, dynamic> _event = {
    'special': {},
    'trigger': {},
    'guard': {},
    'show': {},
    'bind': {},
    'specialDeck': {},
    'mainDeck': {},
    'damage': {},
    'drop': {},
  };

  final List<dynamic> _action = [
    {
      'action': 'block',
      'icon': Icons.block_rounded,
    },
    {
      'action': 'drop',
      'icon': Icons.delete_outline_rounded,
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
      'icon': Icons.wifi_protected_setup_rounded,
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
      'action': 'search',
      'icon': Icons.search_rounded,
    },
    {
      'action': 'show',
      'icon': Icons.remove_red_eye_rounded,
    },
    {
      'action': 'shuffle',
      'icon': Icons.cached_rounded,
    },
    {
      'action': 'special',
      'icon': Icons.copy_rounded,
    },
    {
      'action': 'swap',
      'icon': Icons.amp_stories_rounded,
    }
  ];

  @override
  List<dynamic> getField() => _field;
  Map<String, dynamic> getEvent() => _event;
  List<dynamic> getAction() => _action;
}
