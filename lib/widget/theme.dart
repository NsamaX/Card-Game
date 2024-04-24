import 'package:flutter/material.dart';
import 'color.dart';

ThemeData themE() {
  return ThemeData(
    scaffoldBackgroundColor: primary2,
    primaryColor: primary4,
    primaryColorLight: primary5,
    primaryColorDark: primary0,
    secondaryHeaderColor: secondary,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          color: primary5, fontSize: 32.0, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          color: primary5, fontSize: 26.0, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
          color: primary5, fontSize: 20.0, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: primary5, fontSize: 20.0),
      bodyMedium: TextStyle(color: primary5, fontSize: 16.0),
      bodySmall: TextStyle(color: primary5, fontSize: 12.0),
    ),
    iconTheme: IconThemeData(color: primary5, size: 16.0),
    cardTheme: CardTheme(color: Colors.transparent),
    appBarTheme: AppBarTheme(
      backgroundColor: primary3,
      iconTheme: IconThemeData(color: secondary, size: 20.0),
      titleTextStyle: TextStyle(
          color: secondary, fontSize: 16.0, fontWeight: FontWeight.bold),
      toolbarTextStyle: TextStyle(
          color: secondary, fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary1,
      selectedItemColor: secondary,
      unselectedItemColor: primary5,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(primary4)),
    ),
  );
}
