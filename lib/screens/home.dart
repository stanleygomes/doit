import 'package:doit/components/Fab.dart';
import 'package:doit/components/custom/TopBar.dart';
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopBar(
              title: 'Hello, Stanley!',
              imageUrl:
                  'https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9',
            ),
            H1(label: 'Work in progress...'),
            H1(label: '')
          ],
        ),
      ),
      floatingActionButton: Fab(
        tooltip: 'tooltip',
        onPressed: () {},
      ),
    );
  }
}
