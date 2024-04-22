import 'package:flutter/material.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/label.dart';
import 'contents.dart';
import 'icons.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apPbaR(
        menu: icons,
        onTap: getOnTapCallbacks(context),
      ),
      body: labeL(label: label),
      bottomNavigationBar: bottoMnaV(currentIndex: 2),
    );
  }
}
