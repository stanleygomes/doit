import 'package:flutter/widgets.dart';

class TitleMin extends StatelessWidget {
  final String label;
  final double? fontSize;

  TitleMin({
    Key? key,
    required this.label,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
          child: Text(
            label,
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
