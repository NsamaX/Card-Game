import 'package:flutter/material.dart';
import '../deck/page.dart';
import '../setting/page.dart';

final List<dynamic> icons = [
  Icons.arrow_back_ios_new_rounded,
  'Card Info',
  Icons.filter_list_alt,
];

List<Function> getOnTapCallbacks(BuildContext context, String page) {
  return [
    () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                page == 'setting' ? SettingPage() : DeckPage()),
      );
    },
    () {},
    () {},
  ];
}
