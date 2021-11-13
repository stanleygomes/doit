import 'package:doit/components/alert.dart';
import 'package:doit/components/button.dart';
import 'package:doit/components/label_error.dart';
import 'package:doit/components/text_field.dart';
import 'package:doit/config/theme.dart';
import 'package:doit/models/goal.dart';
import 'package:doit/services/firebase_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:doit/components/app_bar_back.dart';
import 'package:doit/components/card_basic_text.dart';
import 'package:doit/models/screen_arguments.dart';
import 'package:doit/models/auth.dart';

class GoalFormScreen extends StatefulWidget {
  static String routeName = 'goal_create';

  GoalFormScreen();

  @override
  _GoalFormScreenState createState() => _GoalFormScreenState();
}

class _GoalFormScreenState extends State<GoalFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String formGoal;
  Color? formColor = Colors.cyan;
  bool isSubmiting = false;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var auth = context.watch<AuthModel>();
    FirebaseFirestoreService firestore = FirebaseFirestoreService();

    _setGoalName(String? newName) {
      setState(() {
        formGoal = newName!;
      });
    }

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

    _postSubmit(String message) {
      _setSubmiting(false);
      CAlert.showMessage(context, message);
    }

    _create(Map<String, dynamic> goal) {
      firestore
          .create(GoalModel.collectionName, goal, auth.user!.id)
          .then((id) {
        _postSubmit(t.yourGoalCreated);
      }).catchError((error) {
        print(error);
        _postSubmit(t.sorryOcurredAnError);
      });
    }

    _update() {}

    _submitForm() {
      if (_formKey.currentState!.validate()) {
        _setSubmiting(true);
        Map<String, dynamic> goal = new GoalModel(
          color: formColor!,
          name: formGoal,
        ).toJson();

        _create(goal);
      }
    }

    return Scaffold(
      appBar: AppBarBack(
        title: t.createGoal,
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
                  autofocus: true,
                  onChanged: _setGoalName,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(t.pickColor),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
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
                              isBordered: color == formColor,
                              onPressed: () => _setColor(color),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 30,
                  ),
                  child: formColor == null
                      ? LabelError(message: t.requiredField)
                      : null,
                ),
                Button(
                  type: 'elevated',
                  label: t.save,
                  onPressed: this.isSubmiting == true ? null : _submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
