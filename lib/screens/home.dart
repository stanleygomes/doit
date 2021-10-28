import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:doit/components/Spacing.dart';
import 'package:doit/components/Typography.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
