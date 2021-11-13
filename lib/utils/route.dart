import 'package:doit/models/screen_arguments.dart';
import 'package:flutter/widgets.dart';

class RouteUtil {
  static ScreenArguments routeParams(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;

    if (args != null) {
      return args as ScreenArguments;
    }

    return ScreenArguments();
  }
}
