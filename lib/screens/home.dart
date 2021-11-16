import 'package:doit/components/custom/goal_card.dart';
import 'package:doit/components/title_min.dart';
import 'package:doit/components/alert.dart';
import 'package:doit/components/navigator.dart';
import 'package:doit/models/goal.dart';
import 'package:doit/models/screen_arguments.dart';
import 'package:doit/screens/goal.dart';
import 'package:doit/screens/goal_form.dart';
import 'package:doit/screens/goals.dart';
import 'package:doit/services/firebase_firestore.dart';
import 'package:doit/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  List<GoalModel> goals = [];

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var auth = context.watch<AuthModel>();
    var user = auth.user;
    var userFistName = StringUtil.getFirstName(user?.displayName);

    _createGoal() {
      CNavigator.stack(context, GoalFormScreen.routeName);
    }

    _openGoal(String id) {
      CNavigator.stack(
        context,
        GoalScreen.routeName,
        ScreenArguments(id: id),
      );
    }

    _openGoals() {
      CNavigator.stack(
        context,
        GoalsScreen.routeName,
      );
    }

    _updateGoalsList(List<GoalModel> docs) {
      setState(() {
        goals = docs;
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

    _getGoalWidgets() {
      List<Widget> goalsWidgets = [];
      int maxItensLength = 5;

      for (var i = 0; i < goals.length; i++) {
        if (i >= maxItensLength) {
          break;
        }

        GoalModel goal = goals[i];

        goalsWidgets.add(
          GoalCard(
            name: goal.name,
            background: goal.color,
            onPressed: () => _openGoal(goal.id!),
          ),
        );
      }

      if (goals.length > maxItensLength) {
        goalsWidgets.add(
          GoalCard(
            name: t.allGoals,
            background: Colors.white,
            textColor: Colors.black45,
            onPressed: () => _openGoals(),
          ),
        );
      }

      return goalsWidgets;
    }

    _initScreen();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(
              title: userFistName,
              imageUrl: user?.photoUrl,
            ),
            TitleMin(
              label: t.myGoals,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: goals.length == 0 ? Text(t.createFistGoal) : null,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getGoalWidgets(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TitleMin(
                label: t.myTasks,
              ),
            ),
            Expanded(
              child: Text('Tasks will be here!'),
            ),
            H1(label: ''),
          ],
        ),
      ),
      floatingActionButton: Fab(
        tooltip: 'tooltip',
        onPressed: _createGoal,
      ),
    );
  }
}
