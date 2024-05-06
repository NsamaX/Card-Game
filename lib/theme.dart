import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// font example: https://fonts.google.com/

const Color primary1 = Color.fromARGB(255, 10, 20, 30);
const Color primary2 = Color.fromARGB(255, 20, 30, 40);
const Color primary3 = Color.fromARGB(255, 30, 40, 50);
const Color primary4 = Color.fromARGB(255, 40, 50, 60);
const Color secondary = Color.fromARGB(255, 60, 140, 220);

ThemeData themeData() {
  return ThemeData(
    scaffoldBackgroundColor: primary2,
    primaryColor: primary4,
    secondaryHeaderColor: secondary,
    iconTheme: IconThemeData(color: Colors.white, size: 16),
    textTheme: TextTheme(
      titleLarge: titleStyle(32),
      titleMedium: titleStyle(28),
      titleSmall: titleStyle(24),
      bodyLarge: bodyStyle(20),
      bodyMedium: bodyStyle(16),
      bodySmall: bodyStyle(12),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(primary4)),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primary3,
      iconTheme: IconThemeData(color: secondary, size: 24),
      titleTextStyle: titleStyle(16).copyWith(color: secondary),
      toolbarTextStyle: titleStyle(16).copyWith(color: secondary),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary1,
      selectedItemColor: secondary,
      unselectedItemColor: Colors.white,
    ),
  );
}

TextStyle titleStyle(double fontSize) {
  return TextStyle(
    color: Colors.white,
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
}

TextStyle bodyStyle(double fontSize) {
  return TextStyle(
    color: Colors.white,
    fontSize: fontSize,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
}
