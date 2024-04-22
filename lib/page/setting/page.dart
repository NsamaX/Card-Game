import 'package:flutter/material.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/label.dart';
import 'content.dart';
import 'menu.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    content _c = content();
    menu _m = menu();

    return Scaffold(
      appBar: apPbaR(
        menu: _m.getMenu(),
        onTap: _m.getOnTap(),
      ),
      body: labeL(label: _c.getLabel()),
      bottomNavigationBar: bottoMnaV(currentIndex: 2),
    );
  }
}
