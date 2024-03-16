import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0xFF5D9CEC);
  static Color backgroundColorLight = const Color(0xFFDFECDB);
  static Color backgroundColorDark = const Color(0xFF060E1E);
  static Color greenColor = const Color(0xFF61E757);
  static Color blackColor = const Color(0xFF383838);
  static Color bottombarColorDark = const Color(0xFF141922);
  static Color white = Colors.white;
  static Color unselectedIconColor = const Color(0xFFC8C9CB);

  static ThemeData lightmode = ThemeData(
    appBarTheme: AppBarTheme(
        color: primaryColor, titleTextStyle: TextStyle(color: white)),
    scaffoldBackgroundColor: backgroundColorLight,
    bottomAppBarTheme: BottomAppBarTheme(surfaceTintColor: white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: primaryColor,
        unselectedItemColor: unselectedIconColor),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: white,
      dayStyle: TextStyle(color: blackColor),
      yearStyle: TextStyle(color: blackColor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: white,
      shape: CircleBorder(
        side: BorderSide(color: white, width: 4),
      ),
      iconSize: 35,
    ),
  );

  static ThemeData darkmode = ThemeData(
    appBarTheme: AppBarTheme(
        color: primaryColor,
        titleTextStyle: TextStyle(color: backgroundColorDark)),
    scaffoldBackgroundColor: backgroundColorDark,
    bottomAppBarTheme: BottomAppBarTheme(surfaceTintColor: backgroundColorDark),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: primaryColor,
        unselectedItemColor: unselectedIconColor),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: backgroundColorDark,
      dayStyle: TextStyle(color: white),
      yearStyle: TextStyle(color: white),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: white,
      shape: CircleBorder(
        side: BorderSide(color: bottombarColorDark, width: 4),
      ),
      iconSize: 35,
    ),
  );
}
