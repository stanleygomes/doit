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

  static void popAndPushNamed(BuildContext context, String url,
      [ScreenArguments? arguments]) {
    Navigator.popAndPushNamed(
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

  static void goBackManyTimes(BuildContext context, int times) {
    int count = 0;
    Navigator.of(context).popUntil((_) => count++ >= times);
  }
}
