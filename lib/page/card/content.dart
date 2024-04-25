import 'package:flutter/material.dart';

class contenT {
  final List<dynamic> _filter = [
    [
      {
        'icon': Icons.swap_vert_outlined,
        'text': 'Sort',
      },
      {
        'icon': Icons.search_rounded,
        'text': 'Search',
      },
    ],
    [
      {
        'icon': null,
        'text': 'Clan',
      },
      {
        'icon': null,
        'text': 'Nation',
      },
      {
        'icon': null,
        'text': 'Type',
      },
      {
        'icon': null,
        'text': 'Grade',
      },
      {
        'icon': null,
        'text': 'Skill',
      },
      {
        'icon': null,
        'text': 'Power',
      },
      {
        'icon': null,
        'text': 'Shield',
      },
    ],
    [
      {
        'icon': null,
        'text': 'Format',
      },
      {
        'icon': null,
        'text': 'Set',
      },
    ]
  ];

  List<dynamic> getFilter() => _filter;
}
