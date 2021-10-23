import 'package:doit/components/Button.dart';
import 'package:doit/components/Spacing.dart';
import 'package:doit/components/Typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPadding(
              value: 30,
              child: Image(
                image: AssetImage('images/app-icon.png'),
                width: 100,
              ),
            ),
            H1(
              label: 'Do it!',
            ),
            CustomPadding(
              value: 10,
              child: Paragraph(
                label: 'A todo app for everything.',
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
                      label: 'Login com google',
                      huge: true,
                      onPressed: () {},
                    ),
                  ),
                  Button(
                    type: 'outlined',
                    label: 'Pular',
                    huge: true,
                    onPressed: () {},
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
