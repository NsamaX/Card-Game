import 'package:flutter/material.dart';

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

const Color mainColor1 = Color(0xFF161616);
const Color mainColor2 = Color(0xFF1E1E1E);
const Color mainColor3 = Color(0xFF282828);
const Color mainColor4 = Color(0xFF404040);
const Color subColor = Color(0xFF5686E1);
const Color goldColor = Color(0xFFFFC700);
