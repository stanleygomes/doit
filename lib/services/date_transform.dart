import 'package:intl/intl.dart';

class DateTransform {
  static String nowFormat() {
    DateTime now = DateTime.now();
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
  }
}
