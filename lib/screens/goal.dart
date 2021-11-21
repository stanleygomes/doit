import 'package:doit/components/custom/task_create.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:doit/components/custom/task_list.dart';
import 'package:doit/components/alert.dart';
import 'package:doit/components/navigator.dart';
import 'package:doit/models/goal.dart';
import 'package:doit/screens/goal_form.dart';
import 'package:doit/services/firebase_firestore.dart';
import 'package:doit/utils/route.dart';
import 'package:doit/components/app_bar_back.dart';
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
  String _title = 'Carregando...';

  _initScreen(context) {
    var t = AppLocalizations.of(context)!;
    var args = RouteUtil.routeParams(context);
    String collectionId = args.id!;

    firestore
        .getDocument(GoalModel.collectionName, collectionId)
        .then((document) {
      var goal = GoalModel.fromJson(document);

      setState(() {
        _title = goal.name;
      });
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
    var args = RouteUtil.routeParams(context);
    var auth = context.watch<AuthModel>();
    String userId = auth.user!.id!;
    String collectionId = args.id!;

    _editGoal() {
      CNavigator.stack(
        context,
        GoalFormScreen.routeName,
        ScreenArguments(id: args.id),
      );
    }

    print('pai');

    return Scaffold(
      appBar: AppBarBack(
        title: this._title,
        fontWeight: 'bold',
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit',
            onPressed: _editGoal,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: TaskList(
            goalId: collectionId,
            userId: userId,
          ),
        ),
      ),
      floatingActionButton: TaskCreate(
        collectionName: collectionId,
        userId: userId,
      ),
    );
  }
}
