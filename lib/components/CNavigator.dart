import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CNavigator {
  static void stack(BuildContext context, String url) {
    Navigator.pushNamed(
      context,
      url,
    );
  }

  static void replace(BuildContext context, String url) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      url,
      (route) => false,
    );
  }
}
