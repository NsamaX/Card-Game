import 'package:flutter/material.dart';
import '../setting/page.dart';

final List<dynamic> icons = [
  Icons.arrow_back_ios_new_rounded,
  'Card Info',
  Icons.filter_list_alt,
];

List<Function> getOnTapCallbacks(BuildContext context) {
  return [
    () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SettingPage()),
      );
    },
    () {},
    () {},
  ];
}
