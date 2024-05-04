import 'package:flutter/material.dart';
import 'package:project/service/setting.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/label.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        menuItem: ['Setting'],
        onTapmenuItem: [null],
      ),
      body: Label(label: SettingService().getSetting()),
      bottomNavigationBar: BottomNavigation(currentIndex: 2),
    );
  }
}
