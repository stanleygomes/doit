import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:doit/models/user.dart' as UserModel;
import 'package:doit/services/auth.dart';
import 'package:doit/components/Button.dart';
import 'package:doit/components/CDialog.dart';
import 'package:doit/components/Spacing.dart';
import 'package:doit/components/Typography.dart';
import 'package:doit/services/firebase.dart';

class Home extends StatefulWidget {
  static String routeName = 'home';

  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPadding(
              value: 30,
              child: Image(
                image: AssetImage('assets/images/app-icon.png'),
                width: 100,
              ),
            ),
            H1(
              label: 'home',
            ),
            CustomPadding(
              value: 10,
              child: Paragraph(
                label: t.slogan,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
