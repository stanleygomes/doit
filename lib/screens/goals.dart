import 'package:doit/components/alert.dart';
import 'package:doit/components/empty_state.dart';
import 'package:doit/models/goal.dart';
import 'package:doit/models/screen_arguments.dart';
import 'package:doit/screens/goal.dart';
import 'package:doit/screens/goal_form.dart';
import 'package:doit/services/firebase_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:doit/components/app_bar_back.dart';
import 'package:doit/components/navigator.dart';
import 'package:doit/components/card_basic_text.dart';
import 'package:doit/components/fab.dart';
import 'package:doit/models/auth.dart';

class GoalsScreen extends StatefulWidget {
  static String routeName = 'goals';

  GoalsScreen();

  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  List<GoalModel> _goals = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var auth = Provider.of<AuthModel>(context, listen: true);

    _openGoal(String id) {
      CNavigator.stack(
        context,
        GoalScreen.routeName,
        ScreenArguments(id: id),
      );
    }

    _createGoal() {
      CNavigator.stack(context, GoalFormScreen.routeName);
    }

    _updateGoalsList(List<GoalModel> docs) {
      setState(() {
        _goals = docs;
      });
    }

    _initScreen() {
      firestore
          .getDocumentsFromCollection(GoalModel.collectionName, auth.user!.id!)
          .then((documents) {
        var goals =
            documents.map((document) => GoalModel.fromJson(document)).toList();
        _updateGoalsList(goals);
      }).catchError((error) {
        print(error);
        CAlert.showMessage(context, t.sorryOcurredAnError);
      });
    }

    _initScreen();

    return Scaffold(
      appBar: AppBarBack(
        title: t.myGoals,
        fontWeight: 'bold',
      ),
      body: SafeArea(
        child: _goals.length == 0
            ? EmptyState(label: t.createFistGoal)
            : SingleChildScrollView(
                child: Column(
                  children: _goals.map(
                    (goal) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: CardBasicText(
                          textColor: Colors.white,
                          backgroundColor: goal.color,
                          text: goal.name,
                          onPressed: () {
                            _openGoal(goal.id!);
                          },
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
      ),
      floatingActionButton: Fab(
        tooltip: 'tooltip',
        onPressed: _createGoal,
      ),
    );
  }
}
