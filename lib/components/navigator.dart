import 'package:doit/models/screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CNavigator {
  static void stack(BuildContext context, String url,
      [ScreenArguments? arguments]) {
    Navigator.pushNamed(
      context,
      url,
      arguments: arguments,
    );
  }

  static void replace(BuildContext context, String url,
      [ScreenArguments? arguments]) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      url,
      (route) => false,
      arguments: arguments,
    );
  }

  static void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
