import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  final Color primaryColor = Color.fromARGB(255, 241, 179, 217);
  final MaterialColor primarySwatch = MaterialColor(
    primaryColor.value,
    <int, Color>{
      50: primaryColor.withOpacity(0.1),
      100: primaryColor.withOpacity(0.2),
      200: primaryColor.withOpacity(0.3),
      300: primaryColor.withOpacity(0.4),
      400: primaryColor.withOpacity(0.5),
      500: primaryColor.withOpacity(0.6),
      600: primaryColor.withOpacity(0.7),
      700: primaryColor.withOpacity(0.8),
      800: primaryColor.withOpacity(0.9),
      900: primaryColor.withOpacity(1),
    },
  );

  final ColorScheme colorScheme = ColorScheme.fromSwatch(
    primarySwatch: primarySwatch,
    backgroundColor: Colors.white,
    cardColor: Colors.white,
    errorColor: Color.fromARGB(255, 204, 138, 133),
  );

  return ThemeData(
    primarySwatch: primarySwatch, // Change this line
    colorScheme: colorScheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.grey),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: primaryColor),
      hintStyle: TextStyle(color: Colors.grey),
      iconColor: primaryColor,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
    ),
  );
}

ThemeData buildDarkTheme() {
  final Color primaryColor = Colors.teal;
  final MaterialColor primarySwatch = MaterialColor(
    primaryColor.value,
    <int, Color>{
      50: primaryColor.withOpacity(0.1),
      100: primaryColor.withOpacity(0.2),
      200: primaryColor.withOpacity(0.3),
      300: primaryColor.withOpacity(0.4),
      400: primaryColor.withOpacity(0.5),
      500: primaryColor.withOpacity(0.6),
      600: primaryColor.withOpacity(0.7),
      700: primaryColor.withOpacity(0.8),
      800: primaryColor.withOpacity(0.9),
      900: primaryColor.withOpacity(1),
    },
  );

  final ColorScheme colorScheme = ColorScheme.fromSwatch(
    primarySwatch: primarySwatch, // Change this line
    backgroundColor: Colors.grey[900]!,
    cardColor: Colors.grey[900]!,
    errorColor: Colors.red,
  );

  return ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850],
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black45,
      selectedItemColor: Colors.tealAccent,
      unselectedItemColor: Colors.white54,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white70),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.tealAccent),
      hintStyle: TextStyle(color: Colors.white70),
      iconColor: Colors.tealAccent,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.tealAccent),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.teal),
      ),
    ),
  );
}
