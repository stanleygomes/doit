import 'package:doit/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {
  final String type;
  final String label;
  final Color? backgroundColorPrimary;
  final bool? huge;
  final Function()? onPressed;

  Button({
    Key? key,
    required this.type,
    required this.label,
    required this.onPressed,
    this.backgroundColorPrimary,
    this.huge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundButtonColor = this.backgroundColorPrimary == null
        ? colorSchemePrimary
        : this.backgroundColorPrimary!;

    if (type == 'text') {
      return TextButton(
        style: TextButton.styleFrom(
          primary: backgroundButtonColor,
          onSurface: colorSchemePrimaryLight,
        ),
        onPressed: onPressed,
        child: Text(label),
      );
    } else if (type == 'outlined') {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: backgroundButtonColor,
          padding: EdgeInsets.symmetric(
            horizontal: huge == true ? 80 : 30,
            vertical: huge == true ? 20 : 15,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
        onPressed: onPressed,
        child: Text(label),
      );
    } else if (type == 'elevated') {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: colorSchemeTextPrimary,
          primary: backgroundButtonColor,
          padding: EdgeInsets.symmetric(
            horizontal: huge == true ? 80 : 30,
            vertical: huge == true ? 20 : 15,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3)),
          ),
        ),
        onPressed: onPressed,
        child: Text(label),
      );
    }

    return Text('Wrong button parameters!');
  }
}
