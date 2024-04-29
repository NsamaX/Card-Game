import 'package:flutter/material.dart';
import 'package:project/page/welcome.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/label.dart';

class setting extends StatelessWidget {
  const setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic> _menu = [
      null,
      'Setting',
      null,
    ];
    final List<Function> _onTap = [
      () {},
      () {},
      () {},
    ];
    final List<dynamic> _label = [
      {
        "title": "Account",
        "content": [
          {'icon': Icons.account_circle, 'text': 'Profile', 'page': null},
          {
            'icon': Icons.stay_current_portrait_rounded,
            'text': 'Sleeve',
            'page': null
          }
        ]
      },
      {
        "title": "General",
        "content": [
          {'icon': Icons.language_rounded, 'text': 'Language', 'page': null},
          {'icon': Icons.help_rounded, 'text': 'Help', 'page': null},
          {'icon': Icons.auto_stories_rounded, 'text': 'About', 'page': null},
          {'icon': Icons.privacy_tip_rounded, 'text': 'Privacy', 'page': null},
          {'icon': Icons.logout_rounded, 'text': 'Sign out', 'page': welcome()}
        ]
      },
      {
        "title": "Support",
        "content": [
          {'icon': Icons.mail_rounded, 'text': 'Contact', 'page': null},
          {'icon': Icons.coffee_rounded, 'text': 'Donate', 'page': null},
          {
            'icon': Icons.api_rounded,
            'text': 'API : https://card-fight-vanguard-api.ue.r.appspot.com',
            'page': null
          }
        ]
      }
    ];

    List<dynamic> _getMenu() => _menu;
    List<Function> _getOnTap() => _onTap;
    List<dynamic> _getLabel() => _label;

    return Scaffold(
      appBar: appBar(
        menu: _getMenu(),
        onTap: _getOnTap(),
      ),
      body: label(label: _getLabel()),
      bottomNavigationBar: bottomNav(currentIndex: 2),
    );
  }
}
