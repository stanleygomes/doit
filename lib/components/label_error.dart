import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LabelError extends StatelessWidget {
  final String message;

  LabelError({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.message,
      style: TextStyle(
        fontSize: 12,
        color: Colors.red,
      ),
    );
  }
}
