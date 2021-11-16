import 'package:doit/components/card_basic_text.dart';
import 'package:doit/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GoalCard extends StatelessWidget {
  final String name;
  final Color background;
  final Color? textColor;
  final Function()? onPressed;

  GoalCard({
    Key? key,
    required this.name,
    required this.background,
    this.textColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 100,
      child: CardBasicText(
        text: StringUtil.ellipsis(this.name, 20),
        textColor: this.textColor == null ? Colors.white : this.textColor!,
        backgroundColor: this.background,
        padding: 20,
        onPressed: this.onPressed,
      ),
    );
  }
}
