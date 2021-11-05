import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarBack extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final String? fontWeight;
  final Color? buttonColor;

  AppBarBack({
    Key? key,
    this.title,
    this.fontWeight,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = buttonColor != null ? buttonColor! : Colors.black;
    var titleWidget = title != null ? Text(this.title!) : null;
    var fontWeightStyle =
        this.fontWeight == 'bold' ? FontWeight.bold : FontWeight.normal;

    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: color),
      titleTextStyle: TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: fontWeightStyle,
      ),
      elevation: 0,
      title: titleWidget,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
