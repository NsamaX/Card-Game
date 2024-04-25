import 'package:flutter/material.dart';

class contenT {
  final List<dynamic> _filter = [
    [
      {
        'icon': Icons.compare_arrows,
        'text': 'Sort',
      },
      {
        'icon': Icons.search_rounded,
        'text': 'Search',
      },
    ],
    [
      {
        'icon': Icons.search_rounded,
        'text': 'Clan',
      },
      {
        'icon': Icons.search_rounded,
        'text': 'Nation',
      },
      {
        'icon': Icons.search_rounded,
        'text': 'Type',
      },
      {
        'icon': Icons.search_rounded,
        'text': 'Grade',
      },
      {
        'icon': Icons.search_rounded,
        'text': 'Skill',
      },
      {
        'icon': Icons.search_rounded,
        'text': 'Power',
      },
      {
        'icon': Icons.search_rounded,
        'text': 'Shield',
      },
    ],
    [
      {
        'icon': Icons.search_rounded,
        'text': 'Format',
      },
      {
        'icon': Icons.search_rounded,
        'text': 'Set',
      },
    ]
  ];

  List<dynamic> getFilter() => _filter;
}
