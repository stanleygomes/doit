import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarBack extends StatelessWidget with PreferredSizeWidget {
  final Color? buttonColor;

  AppBarBack({
    Key? key,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = buttonColor != null ? buttonColor! : Colors.black;

    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: color),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
