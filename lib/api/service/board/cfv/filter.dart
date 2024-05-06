// TODO: set filter

import 'package:flutter/material.dart';
import 'package:project/api/service/board/filter.dart';

class FilterService implements Filter {
  final List<dynamic> filter = [
    [
      {
        'icon': Icons.search_rounded,
        'text': 'Search',
        'options': null,
      },
      {
        'icon': Icons.swap_vert_outlined,
        'text': 'Sort',
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

  @override
  List<dynamic> getFilter() => filter;
}
