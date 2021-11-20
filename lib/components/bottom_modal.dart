import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomModal {
  static Future<void> show(BuildContext parentContext, Widget content,
      [double? height]) async {
    return showModalBottomSheet<void>(
      context: parentContext,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          // height: height == null ? 100 : height,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: content,
            // child: TextField(
            //   autofocus: true,
            // ),
          ),
        );
      },
    );
  }
}
