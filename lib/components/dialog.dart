import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CDialog {
  static Future<void> showOkDialog(
      BuildContext parentContext, String title, String message,
      [String? confirmButtonText, Function()? confirmButtonAction]) async {
    return showDialog<void>(
      context: parentContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(confirmButtonText != null ? confirmButtonText : 'OK'),
              onPressed: confirmButtonAction != null
                  ? confirmButtonAction
                  : () {
                      Navigator.of(context).pop();
                    },
            ),
          ],
        );
      },
    );
  }
}
