import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: Colors.yellow,
    surface: const Color.fromARGB(255, 31, 31, 31),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 31, 31, 31),
    surfaceTintColor: const Color.fromARGB(255, 31, 31, 31),
    foregroundColor: Colors.white,
    shadowColor: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight(700),
    ),
  ),
  dividerTheme: DividerThemeData(color: Colors.white10, thickness: 1),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight(500),
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.white.withValues(alpha: 0.6),
      fontWeight: FontWeight(700),
      fontSize: 14,
    ),
  ),
);
