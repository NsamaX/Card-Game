import 'package:flutter/material.dart';
import 'package:project/widget/app_bar.dart';
import 'package:project/widget/buttom_nav.dart';
import 'package:project/widget/label.dart';
import 'contents.dart';
import 'icons.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        icons: icons,
        onTapCallbacks: getOnTapCallbacks(context),
      ),
      body: Label(contents: contents),
      bottomNavigationBar: BottomNav(currentIndex: 2),
    );
  }
}
