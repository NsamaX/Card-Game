import 'package:flutter/material.dart';
import 'color.dart';

ThemeData themE(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: primary2,
    appBarTheme: AppBarTheme(
      backgroundColor: primary3,
      iconTheme: IconThemeData(color: secondary),
      titleTextStyle: TextStyle(
          color: secondary, fontSize: 16.0, fontWeight: FontWeight.bold),
      toolbarTextStyle: TextStyle(
          color: secondary, fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary1,
      selectedItemColor: secondary,
      unselectedItemColor: Colors.white,
    ),
  );
}
