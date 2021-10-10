import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeWidget extends StatefulWidget {
  final String title;

  HomeWidget({Key? key, required this.title});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('$_counter vez clicado'),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Text(
                '$_counter foi clicado',
                style: TextStyle(
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Ola',
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
