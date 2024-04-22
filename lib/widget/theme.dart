import 'package:flutter/material.dart';
import 'color.dart';

ThemeData themE(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: primary2,
    appBarTheme: AppBarTheme(
      backgroundColor: primary3,
      titleTextStyle: TextStyle(
          color: secondary, fontSize: 16.0, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: secondary),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary1,
      selectedItemColor: secondary,
      unselectedItemColor: Colors.white,
    ),
  );
}
