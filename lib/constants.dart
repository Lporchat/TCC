import 'package:flutter/material.dart';

const noImage = AssetImage("lib/assets/images/no_image.png");

// Light Colors
const kPrimaryColorLight = Colors.blue;
const kBackGroundColorLight = Colors.white;
const kTextColorLight = Colors.black;

// Dark Colors
const kPrimaryColorDark = Colors.deepPurple;
const kBackGroundColorDark = Color(0xFF1F1F1F);
const kTextColorDark = Colors.white;

final lightTheme = ThemeData(
  primaryColor: kPrimaryColorLight,
  primaryColorBrightness: Brightness.light,
  brightness: Brightness.light,
  primaryColorDark: Colors.black,
  accentColor: Colors.grey[500],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
  canvasColor: Colors.white,
  appBarTheme: AppBarTheme(brightness: Brightness.light),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: kBackGroundColorLight,
    selectedItemColor: kBackGroundColorLight,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final darkTheme = ThemeData(
  primaryColor: kPrimaryColorDark,
  primaryColorBrightness: Brightness.dark,
  primaryColorLight: Colors.black,
  brightness: Brightness.dark,
  primaryColorDark: Colors.black,
  accentColor: Colors.grey[500],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.deepPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
  indicatorColor: Colors.white,
  canvasColor: kBackGroundColorDark,
  appBarTheme: AppBarTheme(brightness: Brightness.dark),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: kBackGroundColorDark,
    selectedItemColor: kBackGroundColorDark,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
