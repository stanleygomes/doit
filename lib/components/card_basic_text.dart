import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardBasicText extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Function()? onPressed;

  CardBasicText({
    Key? key,
    required this.backgroundColor,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: this.backgroundColor,
        elevation: 2,
        child: InkWell(
          onTap: this.onPressed,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  this.text,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
