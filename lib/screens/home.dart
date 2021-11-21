import 'package:doit/components/custom/goal_card.dart';
import 'package:doit/components/custom/task_create.dart';
import 'package:doit/components/custom/task_list.dart';
import 'package:doit/components/title_min.dart';
import 'package:doit/components/alert.dart';
import 'package:doit/components/navigator.dart';
import 'package:doit/models/goal.dart';
import 'package:doit/models/screen_arguments.dart';
import 'package:doit/models/task.dart';
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
  List<GoalModel> _goals = [];
  List<Widget> _goalsWidgets = [];

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

  _openCreateGoal() {
    CNavigator.stack(
      context,
      GoalFormScreen.routeName,
    );
  }

  _getGoalWidgets(context) {
    var t = AppLocalizations.of(context)!;
    List<Widget> goalsWidgetsUpdate = [];
    int maxItensLength = 5;

    for (var i = 0; i < _goals.length; i++) {
      if (i >= maxItensLength) {
        break;
      }

      GoalModel goal = _goals[i];

      goalsWidgetsUpdate.add(
        GoalCard(
          name: goal.name,
          background: goal.color,
          onPressed: () => _openGoal(goal.id!),
        ),
      );
    }

    if (_goals.length > maxItensLength) {
      goalsWidgetsUpdate.add(
        GoalCard(
          name: t.allGoals,
          background: Colors.white,
          textColor: Colors.black45,
          onPressed: () => _openGoals(),
        ),
      );
    } else {
      goalsWidgetsUpdate.add(
        GoalCard(
          name: t.createGoal,
          background: Colors.white,
          textColor: Colors.black45,
          onPressed: () => _openCreateGoal(),
        ),
      );
    }

    setState(() {
      _goalsWidgets = goalsWidgetsUpdate;
    });
  }

  _initScreen(context) {
    var t = AppLocalizations.of(context)!;
    var auth = Provider.of<AuthModel>(context, listen: false);

    firestore
        .getDocumentsFromCollection(GoalModel.collectionName, auth.user!.id!)
        .then((documents) {
      var goals =
          documents.map((document) => GoalModel.fromJson(document)).toList();
      setState(() {
        _goals = goals;
      });
      _getGoalWidgets(context);
    }).catchError((error) {
      print(error);
      CAlert.showMessage(context, t.sorryOcurredAnError);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _initScreen(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var auth = Provider.of<AuthModel>(context, listen: true);
    var user = auth.user;
    var userFistName = StringUtil.getFirstName(user?.displayName);
    String userId = auth.user!.id!;
    String collectionId = '_default_$userId';

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
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _goalsWidgets,
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
              child: Padding(
                padding: const EdgeInsets.only(top: 5, right: 15),
                child: TaskList(
                  goalId: collectionId,
                  userId: userId,
                ),
              ),
            ),
            H1(label: ''),
          ],
        ),
      ),
      floatingActionButton: TaskCreate(
        collectionId: collectionId,
        userId: userId,
      ),
    );
  }
}
