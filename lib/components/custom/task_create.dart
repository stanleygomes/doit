import 'package:doit/components/alert.dart';
import 'package:doit/components/bottom_modal.dart';
import 'package:doit/components/fab.dart';
import 'package:doit/components/navigator.dart';
import 'package:doit/components/text_field.dart';
import 'package:doit/models/task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:doit/services/firebase_firestore.dart';
import 'package:doit/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskCreate extends StatelessWidget {
  final String collectionName;
  final String userId;

  TaskCreate({
    Key? key,
    required this.userId,
    required this.collectionName,
  }) : super(key: key);

  final FirebaseFirestoreService firestore = FirebaseFirestoreService();
  final TextEditingController _taskInputController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var args = RouteUtil.routeParams(context);

    _createTask(String? taskName) {
      Map<String, dynamic> document = TaskModel(
        text: taskName!,
        checked: false,
        collection: args.id!,
      ).toJson();

      firestore
          .create(TaskModel.collectionName, document, this.userId)
          .then((id) {
        CNavigator.goBack(context);
        _taskInputController.text = '';
      }).catchError((error) {
        print(error);
        CAlert.showMessage(context, t.sorryOcurredAnError);
      });
    }

    _openModalCreateTask() {
      Widget modalContent = Padding(
        padding: EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 30),
        child: CTextField(
          placeholder: t.typeHereYourTask,
          autofocus: true,
          controller: _taskInputController,
          onFieldSubmitted: _createTask,
        ),
      );

      BottomModal.show(context, modalContent);
    }

    return Fab(
      customIcon: 'create',
      tooltip: 'tooltip',
      onPressed: _openModalCreateTask,
    );
  }
}
