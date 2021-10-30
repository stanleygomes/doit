import 'package:flutter/foundation.dart';
import 'package:doit/models/user.dart';

class AuthModel extends ChangeNotifier {
  late UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }
}
