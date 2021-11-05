import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:doit/config/theme.dart';

class Fab extends StatelessWidget {
  final String tooltip;
  final Function()? onPressed;

  Fab({
    Key? key,
    required this.tooltip,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: this.tooltip,
      onPressed: this.onPressed,
      child: Icon(Icons.add),
      backgroundColor: colorSchemePrimary,
    );
  }
}
