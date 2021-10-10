import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './widgets/home.dart';

main() {
  runApp(RootWidget());
}

class RootWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(title: 'Hello'),
    );
  }
}
