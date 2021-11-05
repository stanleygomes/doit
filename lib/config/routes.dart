import 'package:flutter/widgets.dart';
import 'package:doit/screens/privacy.dart';
import 'package:doit/screens/settings.dart';
import 'package:doit/screens/splash.dart';
import 'package:doit/screens/home.dart';
import 'package:doit/screens/goals.dart';
import 'package:doit/screens/goal.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  PrivacyScreen.routeName: (context) => PrivacyScreen(),
  GoalsScreen.routeName: (context) => GoalsScreen(),
  GoalScreen.routeName: (context) => GoalScreen(),
};
