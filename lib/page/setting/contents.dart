import 'package:flutter/material.dart';
import '../card/page.dart';
import '../welcome/introduce.dart';

final List<dynamic> contents = [
  {
    "topic": "Account",
    "label": [
      {'topic': 'Profile', 'icon': Icons.account_circle, 'page': null},
      {
        'topic': 'Sleeve Card',
        'icon': Icons.stay_current_portrait_rounded,
        'page': null
      }
    ]
  },
  {
    "topic": "General",
    "label": [
      {
        'topic': 'Card Data',
        'icon': Icons.storage_rounded,
        'page': CardsPage(
          page: 'setting',
          save: false,
        )
      },
      {'topic': 'Language', 'icon': Icons.language_rounded, 'page': null},
      {'topic': 'Privacy', 'icon': Icons.privacy_tip_rounded, 'page': null},
      {'topic': 'Help', 'icon': Icons.help_rounded, 'page': null},
      {'topic': 'About', 'icon': Icons.auto_stories_rounded, 'page': null},
      {'topic': 'Sign out', 'icon': Icons.logout_rounded, 'page': IntroducePage()}
    ]
  },
  {
    "topic": "Support",
    "label": [
      {'topic': 'Contact Us', 'icon': Icons.mail_rounded, 'page': null},
      {'topic': 'Donate', 'icon': Icons.coffee_rounded, 'page': null},
      {
        'topic': 'API : https://card-fight-vanguard-api.ue.r.appspot.com',
        'icon': Icons.api_rounded,
        'page': null
      }
    ]
  }
];
