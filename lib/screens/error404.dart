import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Error404Screen extends StatelessWidget {
  static String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('images/app-error.png'),
            width: 100,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text('Sorry, but I got an error to provide this page...'),
          )
        ],
      )),
    );
  }
}
