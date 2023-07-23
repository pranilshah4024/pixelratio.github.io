import 'package:flutter/material.dart';
import 'package:size_config/utils/size_config.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 20, fontFamily: "Poppins-Light"),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white38,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.teal,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black54
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      titleMedium: TextStyle(
        color: Colors.black54,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: Colors.black54,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        color: Colors.black54,
        fontSize: 14,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
            color: Colors.white54, fontSize: 20, fontFamily: "Poppins-Light"),
        shadowColor: Colors.white54),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textSelectionTheme: TextSelectionThemeData(
cursorColor: Colors.white54
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      titleMedium: TextStyle(
        color: Colors.white70,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: Colors.white70,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        color: Colors.white70,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        color: Colors.white70,
        fontSize: 14,
      ),
    ),

  );
}
