import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:doit/config/theme.dart';

class Fab extends StatelessWidget {
  final String tooltip;
  final Function()? onPressed;
  final String? customIcon;

  Fab({
    Key? key,
    required this.tooltip,
    required this.onPressed,
    this.customIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.add;

    if (customIcon == 'edit') {
      icon = Icons.edit;
    }

    return FloatingActionButton(
      tooltip: this.tooltip,
      onPressed: this.onPressed,
      child: Icon(icon),
      backgroundColor: colorSchemePrimary,
    );
  }
}
