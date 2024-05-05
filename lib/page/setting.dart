import 'package:flutter/material.dart';
import 'package:project/service/setting.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/label.dart';

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(menuItem: ['Setting'], onTapmenuItem: [null]),
      body: Label(label: SettingService().getSetting()),
      bottomNavigationBar: BottomNavigation(currentIndex: 2, game: widget.game),
    );
  }
}

class SettingPage extends StatefulWidget {
  final String game;

  const SettingPage({Key? key, required this.game}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}
