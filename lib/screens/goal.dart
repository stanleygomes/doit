import 'package:doit/config/theme.dart';
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

    return Scaffold(
      appBar: AppBarBack(
        title: 'NOME AQUI',
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
    );
  }
}
