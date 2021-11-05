import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? imageFile;
  final double size;

  CAvatar({
    Key? key,
    this.imageUrl,
    this.imageFile,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.imageFile == null && this.imageUrl == null) {
      throw ('Not found photo file or url.');
    }

    ImageProvider<Object>? image;

    if (this.imageUrl != null) {
      image = NetworkImage(this.imageUrl!);
    }

    if (this.imageFile != null) {
      image = AssetImage(this.imageFile!);
    }

    return CircleAvatar(
      radius: this.size,
      backgroundImage: image,
      backgroundColor: Colors.transparent,
    );
  }
}
