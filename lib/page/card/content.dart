import 'package:flutter/material.dart';

class contenT {
  final List<dynamic> _filter = [
    [
      {
        'icon': Icons.swap_vert_outlined,
        'text': 'Sort',
        'options': null,
      },
      {
        'icon': Icons.search_rounded,
        'text': 'Search',
        'options': null,
      },
    ],
    [
      {
        'icon': null,
        'text': 'Clan',
        'options': null,
      },
      {
        'icon': null,
        'text': 'Nation',
        'options': null,
      },
      {
        'icon': null,
        'text': 'Type',
        'options': null,
      },
      {
        'icon': null,
        'text': 'Grade',
        'options': null,
      },
      {
        'icon': null,
        'text': 'Skill',
        'options': null,
      },
      {
        'icon': null,
        'text': 'Power',
        'options': null,
      },
      {
        'icon': null,
        'text': 'Shield',
        'options': null,
      },
    ],
    [
      {
        'icon': null,
        'text': 'Format',
        'options': null,
      },
      {
        'icon': null,
        'text': 'Set',
        'options': null,
      },
    ]
  ];

  List<dynamic> getFilter() => _filter;
}
