import 'package:doit/components/AppBarBack.dart';
import 'package:doit/components/CardBasicText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:doit/components/Fab.dart';
import 'package:doit/models/auth.dart';

class GoalsScreen extends StatefulWidget {
  static String routeName = 'goals';

  GoalsScreen();

  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    // var auth = context.watch<AuthModel>();

    _openGoal() {
      print('Select goal');
    }

    // return Scaffold(
    //   body: SafeArea(
    //     child: Container(
    //       height: 600,
    //       child: ListView(
    //         children: <Widget>[
    //           Stack(
    //             children: <Widget>[
    //               Text('TITULO'),
    //               SingleChildScrollView(
    //                 child: Column(
    //                   children: <Widget>[
    //                     Text('LEFT            '),
    //                     Text('LEFT            '),
    //                     Text('LEFT            '),
    //                     Text('LEFT            '),
    //                     Text('LEFT            '),
    //                     Text('LEFT            '),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    var cards = [
      Colors.indigo,
      Colors.indigo,
      Colors.cyan,
      Colors.teal,
      Colors.purple,
      Colors.orange,
      Colors.red,
      Colors.white,
      Colors.black,
      Colors.pink,
      Colors.orange,
    ];

    return Scaffold(
      appBar: AppBarBack(
        title: t.myGoals,
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
      floatingActionButton: Fab(
        tooltip: 'tooltip',
        onPressed: () {},
      ),
    );
  }
}
