import 'package:flutter/material.dart';
import 'color.dart';

ThemeData themE() {
  return ThemeData(
    scaffoldBackgroundColor: primary2,
    primaryColor: primary4,
    primaryColorLight: Colors.white,
    primaryColorDark: Colors.black,
    secondaryHeaderColor: secondary,
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
    iconTheme: IconThemeData(color: Colors.white, size: 16.0),
    cardTheme: CardTheme(
      color: Colors.transparent,
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primary4),
      ),
    ),
  );
}
