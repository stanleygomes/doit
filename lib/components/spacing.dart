import 'package:flutter/widgets.dart';

class CustomPadding extends StatelessWidget {
  final Widget child;
  final double value;

  CustomPadding({
    Key? key,
    required this.child,
    this.value = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: child,
    );
  }
}
