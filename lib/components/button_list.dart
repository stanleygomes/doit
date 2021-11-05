import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonList extends StatelessWidget {
  final List<Widget> children;

  ButtonList({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: children,
    );
  }
}

class ButtonListItem extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  ButtonListItem({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      onPressed: this.onPressed,
      child: Text(
        this.text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
