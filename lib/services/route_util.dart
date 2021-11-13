import 'package:doit/models/screen_arguments.dart';
import 'package:flutter/widgets.dart';

class RouteUtil {
  static ScreenArguments routeParams(BuildContext context) {
    return ModalRoute.of(context)!.settings.arguments as ScreenArguments;
  }
}
