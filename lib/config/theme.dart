import 'package:flutter/material.dart';

final Color colorSchemePrimary = Colors.green.shade500;
final Color colorSchemePrimaryLight = Colors.green.shade200;
final Color colorSchemeTextPrimary = Colors.white;

final List<Color> materialColorList = [
  Colors.cyan,
  Colors.teal,
  Colors.indigo,
  Colors.orange,
  Colors.red,
  Colors.pink,
  Colors.purple,
];

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
