// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'screens/home.dart';

// main() {
//   runApp(RootWidget());
// }

// class RootWidget extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Hello World',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeWidget(title: 'Hello'),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class HomeWidget extends StatefulWidget {
//   final String title;

//   HomeWidget({Key? key, required this.title});

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<HomeWidget> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   Widget build(BuildContext buildContext) {
//     return Scaffold(
//       appBar: AppBar(
//         // title: Text('$_counter vez clicado'),
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Container(
//               width: double.infinity,
//               margin: EdgeInsets.all(20),
//               child: Text(
//                 '$_counter foi clicado',
//                 style: TextStyle(
//                   fontSize: 30,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [Text('teste')],
//               ),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         tooltip: 'Ola',
//         onPressed: _incrementCounter,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
