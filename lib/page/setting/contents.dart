import 'package:flutter/material.dart';
import '../card/page.dart';
import '../welcome/introduce.dart';

final List<dynamic> contents = [
  {
    "topic": "Account",
    "content": [
      {'icon': Icons.account_circle, 'label': 'Profile', 'page': null},
      {
        'icon': Icons.stay_current_portrait_rounded,
        'label': 'Sleeve Card',
        'page': null
      }
    ]
  },
  {
    "topic": "General",
    "content": [
      {
        'icon': Icons.storage_rounded,
        'label': 'Card Data',
        'page': CardsPage(
          page: 'setting',
          save: false,
        )
      },
      {'icon': Icons.language_rounded, 'label': 'Language', 'page': null},
      {'icon': Icons.privacy_tip_rounded, 'label': 'Privacy', 'page': null},
      {'icon': Icons.help_rounded, 'label': 'Help', 'page': null},
      {'icon': Icons.auto_stories_rounded, 'label': 'About', 'page': null},
      {
        'icon': Icons.logout_rounded,
        'label': 'Sign out',
        'page': IntroducePage()
      }
    ]
  },
  {
    "topic": "Support",
    "content": [
      {'icon': Icons.mail_rounded, 'label': 'Contact Us', 'page': null},
      {'icon': Icons.coffee_rounded, 'label': 'Donate', 'page': null},
      {
        'icon': Icons.api_rounded,
        'label': 'API : https://card-fight-vanguard-api.ue.r.appspot.com',
        'page': null
      }
    ]
  }
];
