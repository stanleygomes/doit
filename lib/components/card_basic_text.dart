import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardBasicText extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final Function()? onPressed;
  final String? text;
  final double? padding;
  final bool? isBordered;

  CardBasicText({
    Key? key,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.text,
    this.padding,
    this.isBordered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderSide border = BorderSide.none;
    double cardPadding = this.padding != null ? this.padding! : 40;
    List<Widget> textWidget = [];

    if (this.text != null) {
      textWidget.add(
        Text(
          this.text!,
          style: TextStyle(
            fontSize: 22,
            color: this.textColor,
          ),
        ),
      );
    }

    if (this.isBordered != null && this.isBordered == true) {
      border = BorderSide(
        color: Colors.black,
        width: 2,
      );
    }

    return SizedBox(
      width: double.infinity,
      child: Card(
        color: this.backgroundColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          side: border,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: InkWell(
          onTap: this.onPressed,
          child: Padding(
            padding: EdgeInsets.all(cardPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: this.text != null ? textWidget : [],
            ),
          ),
        ),
      ),
    );
  }
}
