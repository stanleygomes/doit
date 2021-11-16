import 'package:doit/models/screen_arguments.dart';
import 'package:doit/screens/error404.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RouteUtil {
  static ScreenArguments routeParams(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;

    if (args != null) {
      return args as ScreenArguments;
    }

    return ScreenArguments();
  }

  static MaterialPageRoute getNotFoundPage(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => Error404Screen(),
    );
  }
}
