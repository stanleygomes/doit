import 'package:doit/components/alert.dart';
import 'package:doit/components/fab.dart';
import 'package:doit/components/navigator.dart';
import 'package:doit/config/theme.dart';
import 'package:doit/models/goal.dart';
import 'package:doit/screens/goal_form.dart';
import 'package:doit/services/firebase_firestore.dart';
import 'package:doit/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:doit/components/app_bar_back.dart';
import 'package:doit/components/card_basic_text.dart';
import 'package:doit/models/screen_arguments.dart';
import 'package:doit/models/auth.dart';

class GoalScreen extends StatefulWidget {
  static String routeName = 'goal';

  GoalScreen();

  @override
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  String title = 'Carregando...';

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var args = RouteUtil.routeParams(context);
    // var auth = context.watch<AuthModel>();

    _setTitle(String newTitle) {
      setState(() {
        title = newTitle;
      });
    }

    _initScreen() {
      firestore
          .getDocument(GoalModel.collectionName, args.id!)
          .then((document) {
        var goal = GoalModel.fromJson(document);
        _setTitle(goal.name);
      }).catchError((error) {
        print(error);
        CAlert.showMessage(context, t.sorryOcurredAnError);
      });
    }

    _initScreen();

    _editGoal() {
      CNavigator.stack(
        context,
        GoalFormScreen.routeName,
        ScreenArguments(id: args.id),
      );
    }

    return Scaffold(
      appBar: AppBarBack(
        title: this.title,
        fontWeight: 'bold',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('aqui'),
            ],
          ),
        ),
      ),
      floatingActionButton: Fab(
        customIcon: 'edit',
        tooltip: 'tooltip',
        onPressed: _editGoal,
      ),
    );
  }
}
