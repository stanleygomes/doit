import 'package:flutter/widgets.dart';
import 'package:doit/screens/splash.dart';
import 'package:doit/screens/home.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  Home.routeName: (context) => Home(),
};
