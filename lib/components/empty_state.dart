import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmptyState extends StatelessWidget {
  final String label;
  final double? fontSize;

  EmptyState({
    Key? key,
    required this.label,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.album_outlined,
          color: Colors.black45,
          size: 50,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 50,
            top: 20,
            bottom: 5,
            right: 50,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: fontSize != null ? fontSize : 16,
            ),
          ),
        ),
      ],
    );
  }
}
