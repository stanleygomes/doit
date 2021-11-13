import 'package:doit/components/navigator.dart';
import 'package:doit/screens/goals.dart';
import 'package:doit/utils/string.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:doit/components/fab.dart';
import 'package:doit/components/custom/top_bar.dart';
import 'package:doit/models/auth.dart';
import 'package:doit/components/typography.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // var t = AppLocalizations.of(context)!;
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
            H1(label: ''),
          ],
        ),
      ),
      floatingActionButton: Fab(
        tooltip: 'tooltip',
        onPressed: () {
          CNavigator.stack(context, GoalsScreen.routeName);
        },
      ),
    );
  }
}
