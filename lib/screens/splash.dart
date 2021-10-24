import 'package:doit/services/auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:doit/components/Button.dart';
import 'package:doit/components/Spacing.dart';
import 'package:doit/components/Typography.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = 'splash';

  _incrementCounter() async {
    Auth auth = new Auth();
    await auth.create();
    await auth.getUser();
    await auth.didCompletedIntro();
  }

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
              label: t.appName,
            ),
            CustomPadding(
              value: 10,
              child: Paragraph(
                label: t.slogan,
              ),
            ),
            CustomPadding(
              value: 30,
              child: Column(
                children: [
                  CustomPadding(
                    value: 15,
                    child: Button(
                      type: 'elevated',
                      label: t.loginWithGoogle,
                      huge: true,
                      onPressed: () {},
                    ),
                  ),
                  Button(
                    type: 'outlined',
                    label: t.notNow,
                    huge: true,
                    onPressed: _incrementCounter,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
