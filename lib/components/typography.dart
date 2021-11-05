import 'package:flutter/widgets.dart';

class H1 extends StatelessWidget {
  final String label;
  final double? fontSize;

  H1({
    Key? key,
    required this.label,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize != null ? fontSize : 30,
      ),
    );
  }
}

class Paragraph extends StatelessWidget {
  final String label;
  final double? fontSize;

  Paragraph({
    Key? key,
    required this.label,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: fontSize != null ? fontSize : 18,
      ),
    );
  }
}
