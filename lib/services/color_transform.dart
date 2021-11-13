import 'package:flutter/widgets.dart';

class ColorTransform {
  static String toText(Color color) {
    var hexCode = '#${color.value.toRadixString(16).substring(2, 8)}';
    return hexCode;
  }

  static Color toColor(String color) {
    var hexColor = color.replaceAll("#", "");
    hexColor = "FF" + hexColor;

    return Color(int.parse("0x$hexColor"));
  }
}
