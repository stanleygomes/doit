import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './screens/splash.dart';
import './screens/error404.dart';
import 'config/theme.dart';
import 'config/routes.dart';

main() {
  runApp(RootWidget());
}

class RootWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Do it!',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      routes: routes,
      initialRoute: SplashScreen.routeName,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => Error404Screen(),
        );
      },
    );
  }
}
