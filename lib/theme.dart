// TODO: set theme font

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// example font: https://fonts.google.com/

const Color primary1 = Color.fromARGB(255, 10, 20, 30);
const Color primary2 = Color.fromARGB(255, 20, 30, 40);
const Color primary3 = Color.fromARGB(255, 30, 40, 50);
const Color primary4 = Color.fromARGB(255, 40, 50, 60);
const Color secondary = Color.fromARGB(255, 60, 130, 210);

ThemeData themeData() {
  return ThemeData(
    scaffoldBackgroundColor: primary2,
    primaryColor: primary4,
    secondaryHeaderColor: secondary,
    iconTheme: IconThemeData(color: Colors.white, size: 16),
    textTheme: TextTheme(
      titleLarge: _titleStyle(32),
      titleMedium: _titleStyle(28),
      titleSmall: _titleStyle(24),
      bodyLarge: _bodyStyle(20),
      bodyMedium: _bodyStyle(16),
      bodySmall: _bodyStyle(12),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(primary4)),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primary3,
      iconTheme: IconThemeData(color: secondary, size: 24),
      titleTextStyle: _titleStyle(16).copyWith(color: secondary),
      toolbarTextStyle: _titleStyle(16).copyWith(color: secondary),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary1,
      selectedItemColor: secondary,
      unselectedItemColor: Colors.white,
    ),
  );
}

TextStyle _titleStyle(double fontSize) {
  return TextStyle(
    color: Colors.white,
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
    // fontStyle: GoogleFonts.pacifico().fontStyle,
  );
}

TextStyle _bodyStyle(double fontSize) {
  return TextStyle(
    color: Colors.white,
    fontSize: fontSize,
    // fontStyle: GoogleFonts.pacifico().fontStyle,
  );
}
