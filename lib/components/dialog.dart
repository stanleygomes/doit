import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CDialog {
  static Future<void> showOkDialog(
      BuildContext parentContext, String title, String message,
      [bool? showCancel,
      Function()? confirmButtonAction,
      String? confirmButtonText]) async {
    return showDialog<void>(
      context: parentContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        var t = AppLocalizations.of(context)!;
        List<Widget> actions = <Widget>[];

        if (showCancel == true) {
          actions.add(
            TextButton(
              child: Text(t.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          );
        }

        actions.add(
          TextButton(
            child: Text(confirmButtonText != null ? confirmButtonText : 'OK'),
            onPressed: confirmButtonAction != null
                ? confirmButtonAction
                : () {
                    Navigator.of(context).pop();
                  },
          ),
        );

        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: actions,
        );
      },
    );
  }
}
