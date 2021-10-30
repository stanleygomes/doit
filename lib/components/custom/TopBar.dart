import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:doit/components/CAvatar.dart';
import 'package:doit/components/Typography.dart';

class TopBar extends StatelessWidget {
  final String? title;
  final String? imageUrl;

  TopBar({Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    String hello = this.title != null ? '${t.hello}, ${this.title}' : t.hello;
    var imageFile;

    if (this.imageUrl == null) {
      imageFile = 'assets/images/avatar-placement.jpg';
    }

    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          H1(
            label: hello,
          ),
          CAvatar(
            imageUrl: this.imageUrl,
            imageFile: imageFile,
            size: 25,
          ),
        ],
      ),
    );
  }
}
