import 'dart:convert';
import 'package:doit/models/user.dart';
import 'package:doit/services/local_storage.dart';

class Auth {
  LocalStorageService _localStorageService = new LocalStorageService('auth');

  Future<void> create(User? user) async {
    if (user != null) {
      this.createUser(user);
    }

    await this._localStorageService.setItem('completedIntro', 'true');
  }

  Future<User> createUser(User user) async {
    String jsonUser = jsonEncode(user);
    await this._localStorageService.setItem('user', jsonUser);

    return user;
  }

  Future<User> getUser() async {
    var stringUser = await this._localStorageService.getItem('user');
    var jsonUser = jsonDecode(stringUser);

    return User(
      id: jsonUser['id'],
      serverAuthCode: jsonUser['serverAuthCode'],
      email: jsonUser['email'],
      displayName: jsonUser['displayName'],
      photoUrl: jsonUser['photoUrl'],
    );
  }

  Future<bool> didCompletedIntro() async {
    var stringConfig =
        await this._localStorageService.getItem('completedIntro');
    var jsonConfig = jsonDecode(stringConfig);

    return jsonConfig;
  }
}
