import 'package:doit/components/CAvatar.dart';
import 'package:doit/components/Typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopBar extends StatelessWidget {
  final String title;
  final String imageUrl;

  TopBar({Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          H1(
            label: this.title,
          ),
          CAvatar(
            imageUrl: this.imageUrl,
            size: 25,
          )
        ],
      ),
    );
  }
}
