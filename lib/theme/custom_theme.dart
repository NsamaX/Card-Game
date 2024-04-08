import 'package:flutter/material.dart';
import 'color.dart';

ThemeData customTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: mainColor2,
    appBarTheme: AppBarTheme(
      backgroundColor: mainColor3,
      iconTheme: IconThemeData(color: subColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: mainColor1,
      selectedItemColor: subColor,
      unselectedItemColor: Colors.white,
    ),
  );
}
