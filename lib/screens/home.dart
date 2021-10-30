import 'package:doit/services/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:doit/components/Fab.dart';
import 'package:doit/components/custom/TopBar.dart';
import 'package:doit/models/auth.dart';
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
    var auth = context.watch<AuthModel>();
    var user = auth.user;
    var userFistName = StringUtil.getFirstName(user?.displayName);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopBar(
              title: userFistName,
              imageUrl: user?.photoUrl,
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
