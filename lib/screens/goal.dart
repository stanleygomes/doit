import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:doit/components/AppBarBack.dart';
import 'package:doit/components/CardBasicText.dart';
import 'package:doit/models/screen_arguments.dart';
import 'package:doit/models/auth.dart';

class GoalScreen extends StatefulWidget {
  static String routeName = 'goal';

  GoalScreen();

  @override
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    // var auth = context.watch<AuthModel>();
    var args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    print('#############');
    print('args: ');
    print(args.id);

    _openGoal() {
      print('Select goal');
    }

    var cards = [
      Colors.indigo,
    ];

    return Scaffold(
      appBar: AppBarBack(
        title: 'NOME AQUI',
        fontWeight: 'bold',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: cards.map(
              (card) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: CardBasicText(
                    backgroundColor: card,
                    text: 'Viajar',
                    onPressed: _openGoal,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}