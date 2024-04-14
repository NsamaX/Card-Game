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
      appBar: appBar(
        context: context,
        menus: menus,
        onTap: getOnTap(context),
      ),
      body: Label(label: contents),
      bottomNavigationBar: BottomNav(currentIndex: 2),
    );
  }
}
