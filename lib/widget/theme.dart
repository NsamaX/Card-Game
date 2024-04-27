import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

const Color primary1 = Color.fromARGB(255, 20, 20, 20);
const Color primary2 = Color.fromARGB(255, 30, 30, 30);
const Color primary3 = Color.fromARGB(255, 40, 40, 40);
const Color primary4 = Color.fromARGB(255, 60, 60, 60);
const Color secondary = Color.fromARGB(255, 80, 140, 225);

ThemeData themE() {
  return ThemeData(
    scaffoldBackgroundColor: primary2,
    primaryColor: primary4,
    secondaryHeaderColor: secondary,
    iconTheme: IconThemeData(color: Colors.white, size: 16.0),
    // fontFamily: GoogleFonts.nunito().fontFamily,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          color: Colors.white, fontSize: 26.0, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.white, fontSize: 20.0),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 16.0),
      bodySmall: TextStyle(color: Colors.white, fontSize: 12.0),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(primary4)),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primary3,
      iconTheme: IconThemeData(color: secondary, size: 22.0),
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
