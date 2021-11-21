import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:doit/components/alert.dart';
import 'package:doit/config/theme.dart';
import 'package:doit/models/task.dart';
import 'package:doit/models/auth.dart';
import 'package:doit/services/firebase_firestore.dart';

class TaskList extends StatefulWidget {
  final String goalId;
  final String userId;
  static String routeName = 'goal';

  TaskList({
    Key? key,
    required this.goalId,
    required this.userId,
  }) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState(this.goalId, this.userId);
}

class _TaskListState extends State<TaskList> {
  final String goalId;
  final String userId;

  _TaskListState(this.goalId, this.userId);

  FirebaseFirestoreService firestore = FirebaseFirestoreService();

  _initScreen(context) {
    var t = AppLocalizations.of(context)!;
    var auth = Provider.of<AuthModel>(context, listen: false);
    auth.setTaskList([]);

    firestore
        .getDocumentsFromCollection(
      TaskModel.collectionName,
      this.userId,
      this.goalId,
    )
        .then((documents) {
      var tasks =
          documents.map((document) => TaskModel.fromJson(document)).toList();
      auth.setTaskList(tasks);
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
    var taskList = auth.taskList;

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };

      if (states.any(interactiveStates.contains)) {
        return colorSchemePrimary;
      }

      return colorSchemePrimary;
    }

    _checkTask(TaskModel task, bool isChecked) {
      task.checked = isChecked;
      Map<String, dynamic> document = task.toJson();

      firestore
          .update(TaskModel.collectionName, document, task.id!, userId)
          .then((status) {
        this._initScreen(context);
      }).catchError((error) {
        print(error);
        CAlert.showMessage(context, t.sorryOcurredAnError);
      });

      return isChecked;
    }

    _deleteTask(String taskId) {
      firestore.delete(TaskModel.collectionName, taskId, userId).then((status) {
        CAlert.showMessage(context, t.yourGoalDeleted);
        this._initScreen(context);
      }).catchError((error) {
        print(error);
        CAlert.showMessage(context, t.sorryOcurredAnError);
      });
    }

    print('filho');

    return SingleChildScrollView(
      child: Column(
        children: taskList.map((task) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: task.checked,
                    onChanged: (bool? isChecked) =>
                        _checkTask(task, isChecked!),
                  ),
                  Text(task.text),
                ],
              ),
              InkWell(
                radius: 5,
                onTap: () => _deleteTask(task.id!),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    Icons.close,
                    color: Colors.black54,
                    size: 20,
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
