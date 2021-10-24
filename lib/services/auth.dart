import 'dart:convert';
import 'package:doit/models/user.dart';
import 'package:doit/services/local_storage.dart';

class Auth {
  LocalStorageService _localStorageService = new LocalStorageService('auth');

  Future<User> create() async {
    var user = User(
      id: 1,
      name: 'Fulano',
    );

    String jsonUser = jsonEncode(user);

    await this._localStorageService.setItem('user', jsonUser);
    await this._localStorageService.setItem('completedIntro', 'true');

    return user;
  }

  Future<User> getUser() async {
    var stringUser = await this._localStorageService.getItem('user');
    var jsonUser = jsonDecode(stringUser);

    return User(
      id: jsonUser['id'],
      name: jsonUser['name'],
    );
  }

  Future<bool> didCompletedIntro() async {
    var stringConfig =
        await this._localStorageService.getItem('completedIntro');
    var jsonConfig = jsonDecode(stringConfig);

    return jsonConfig;
  }
}
