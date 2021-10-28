import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;

  CAvatar({
    Key? key,
    required this.imageUrl,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: this.size,
      backgroundImage: NetworkImage(this.imageUrl),
      backgroundColor: Colors.transparent,
    );
  }
}
