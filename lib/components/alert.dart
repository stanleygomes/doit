import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CAlert {
  static void showMessage(BuildContext parentContext, String message,
      [String? actionButtonText, Function()? actionButtonOnPressed]) {
    var action;

    if (actionButtonText != null) {
      action = SnackBarAction(
        label: actionButtonText,
        onPressed: actionButtonOnPressed!,
      );
    }

    ScaffoldMessenger.of(parentContext).showSnackBar(
      SnackBar(
        content: Text(message),
        action: action,
      ),
    );
  }
}
