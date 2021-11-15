import 'package:doit/components/alert.dart';
import 'package:doit/components/button.dart';
import 'package:doit/components/dialog.dart';
import 'package:doit/components/label_error.dart';
import 'package:doit/components/navigator.dart';
import 'package:doit/components/text_field.dart';
import 'package:doit/config/theme.dart';
import 'package:doit/models/goal.dart';
import 'package:doit/screens/goals.dart';
import 'package:doit/services/firebase_firestore.dart';
import 'package:doit/utils/color.dart';
import 'package:doit/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:doit/components/app_bar_back.dart';
import 'package:doit/components/card_basic_text.dart';
import 'package:doit/models/auth.dart';

class GoalFormScreen extends StatefulWidget {
  static String routeName = 'goal_create';

  GoalFormScreen();

  @override
  _GoalFormScreenState createState() => _GoalFormScreenState();
}

class _GoalFormScreenState extends State<GoalFormScreen> {
  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  final _formKey = GlobalKey<FormState>();
  Color? formColor = Colors.cyan;
  bool isSubmiting = false;

  TextEditingController _nameController = new TextEditingController();

  _initScreen(context) {
    var args = RouteUtil.routeParams(context);
    var t = AppLocalizations.of(context)!;

    if (args.id != null) {
      firestore
          .getDocument(GoalModel.collectionName, args.id!)
          .then((document) {
        var goal = GoalModel.fromJson(document);
        _nameController.text = goal.name;

        setState(() {
          formColor = goal.color;
        });
      }).catchError((error) {
        print(error);
        CAlert.showMessage(context, t.sorryOcurredAnError);
      });
    }
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
    var auth = context.watch<AuthModel>();
    var args = RouteUtil.routeParams(context);

    _setColor(Color color) {
      setState(() {
        formColor = color;
      });
    }

    _setSubmiting(bool status) {
      setState(() {
        isSubmiting = status;
      });
    }

    _postSubmit(String message, [bool? goBack]) {
      _setSubmiting(false);
      CAlert.showMessage(context, message);

      if (goBack == true) {
        CNavigator.goBack(context);
      }
    }

    _create(Map<String, dynamic> goal) {
      firestore
          .create(GoalModel.collectionName, goal, auth.user!.id)
          .then((id) {
        _postSubmit(t.yourGoalCreated, true);
      }).catchError((error) {
        print(error);
        _postSubmit(t.sorryOcurredAnError);
      });
    }

    _update(Map<String, dynamic> goal, String id) {
      firestore
          .update(GoalModel.collectionName, goal, id, auth.user!.id)
          .then((id) {
        _postSubmit(t.yourGoalUpdated, true);
      }).catchError((error) {
        print(error);
        _postSubmit(t.sorryOcurredAnError);
      });
    }

    _confirmDelete() {
      firestore
          .delete(GoalModel.collectionName, args.id!, auth.user!.id!)
          .then((status) {
        _postSubmit(t.yourGoalDeleted, true);
        CNavigator.goBackManyTimes(context, 2);
      }).catchError((error) {
        print(error);
        _postSubmit(t.sorryOcurredAnError);
      });
    }

    _delete() {
      CDialog.showOkDialog(
        context,
        t.deleteGoal,
        t.confirmDeleteGoal,
        true,
        _confirmDelete,
      );
    }

    _submitForm() {
      if (_formKey.currentState!.validate()) {
        _setSubmiting(true);
        Map<String, dynamic> goal = new GoalModel(
          id: args.id,
          color: formColor!,
          name: _nameController.text,
        ).toJson();

        if (args.id != null) {
          _update(goal, args.id!);
        } else {
          _create(goal);
        }
      }
    }

    return Scaffold(
      appBar: AppBarBack(
        title: args.id == null ? t.createGoal : t.editGoal,
        fontWeight: 'bold',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTextField(
                  placeholder: t.goalName,
                  autofocus: args.id != null ? false : true,
                  controller: _nameController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(t.pickColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: materialColorList.map(
                        (color) {
                          return SizedBox(
                            width: 70,
                            child: CardBasicText(
                              textColor: color,
                              backgroundColor: color,
                              padding: 30,
                              isBordered: ColorUtil.toText(color) ==
                                  ColorUtil.toText(formColor!),
                              onPressed: () => _setColor(color),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 30,
                  ),
                  child: formColor == null
                      ? LabelError(message: t.requiredField)
                      : null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      type: 'elevated',
                      label: t.save,
                      onPressed: this.isSubmiting == true ? null : _submitForm,
                    ),
                    Button(
                      type: 'elevated',
                      label: t.delete,
                      backgroundColorPrimary: Colors.red,
                      onPressed: this.isSubmiting == true ? null : _delete,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
