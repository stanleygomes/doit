import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:doit/components/spacing.dart';
import 'package:doit/components/avatar.dart';
import 'package:doit/components/typography.dart';

class UserProfile extends StatelessWidget {
  final String? name;
  final String? email;
  final String? imageUrl;

  UserProfile({
    Key? key,
    required this.name,
    required this.email,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var imageFile;

    if (this.imageUrl == null) {
      imageFile = 'assets/images/avatar-placement.jpg';
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CAvatar(
            imageUrl: this.imageUrl,
            imageFile: imageFile,
            size: 50,
          ),
          CustomPadding(
            value: 10,
            child: H1(label: this.name != null ? this.name! : t.goToLogin),
          ),
          Paragraph(
            label: this.email != null ? this.email! : '',
          ),
        ],
      ),
    );
  }
}
