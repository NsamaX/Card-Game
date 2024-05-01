import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// example font: https://fonts.google.com/

const Color _primary1 = Color.fromARGB(255, 10, 20, 30);
const Color _primary2 = Color.fromARGB(255, 20, 30, 40);
const Color _primary3 = Color.fromARGB(255, 30, 40, 50);
const Color _primary4 = Color.fromARGB(255, 40, 50, 60);
const Color _secondary = Color.fromARGB(255, 60, 130, 210);

ThemeData themeData() {
  return ThemeData(
    scaffoldBackgroundColor: _primary2,
    primaryColor: _primary4,
    secondaryHeaderColor: _secondary,
    iconTheme: IconThemeData(color: Colors.white, size: 16.0),
    textTheme: TextTheme(
      titleLarge: _titleStyle(32.0),
      titleMedium: _titleStyle(28.0),
      titleSmall: _titleStyle(24.0),
      bodyLarge: _bodyStyle(20.0),
      bodyMedium: _bodyStyle(16.0),
      bodySmall: _bodyStyle(12.0),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(_primary4)),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _primary3,
      iconTheme: IconThemeData(color: _secondary, size: 24.0),
      titleTextStyle: _titleStyle(16.0).copyWith(color: _secondary),
      toolbarTextStyle: _titleStyle(16.0).copyWith(color: _secondary),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _primary1,
      selectedItemColor: _secondary,
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
