import 'package:doit/components/app_bar_back.dart';
import 'package:doit/components/spacing.dart';
import 'package:doit/components/typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PrivacyScreen extends StatefulWidget {
  static String routeName = 'privacy';

  PrivacyScreen();

  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var privacyImage = AssetImage('assets/images/shield.png');

    return Scaffold(
      appBar: AppBarBack(),
      body: SafeArea(
        child: CustomPadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: privacyImage,
                width: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: H1(label: t.privacy),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Paragraph(label: t.privacyDisclaimer),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
