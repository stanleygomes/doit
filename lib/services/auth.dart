import 'dart:convert';
import 'package:doit/models/user.dart';
import 'package:doit/services/local_storage.dart';

class Auth {
  final String completedIntroKey = 'completedIntro';
  LocalStorageService _localStorageService = new LocalStorageService('auth');

  Future<void> create(UserModel? user) async {
    if (user != null) {
      await this.createUser(user);
    }

    await this._localStorageService.setItem(completedIntroKey, 'true');
  }

  Future<UserModel> createUser(UserModel user) async {
    String jsonUser = jsonEncode(user);
    await this._localStorageService.setItem('user', jsonUser);

    return user;
  }

  Future<UserModel> getUser() async {
    var stringUser = await this._localStorageService.getItem('user');
    var jsonUser = jsonDecode(stringUser);

    return UserModel(
      id: jsonUser['id'],
      serverAuthCode: jsonUser['serverAuthCode'],
      email: jsonUser['email'],
      displayName: jsonUser['displayName'],
      photoUrl: jsonUser['photoUrl'],
    );
  }

  Future<bool> didCompletedIntro() async {
    dynamic stringConfig =
        await this._localStorageService.getItem(completedIntroKey);
    if (stringConfig == null) {
      return false;
    }

    var jsonConfig = jsonDecode(stringConfig);
    return jsonConfig;
  }

  Future<void> signOut() async {
    await this._localStorageService.removeItem(completedIntroKey);
    await this._localStorageService.removeItem('user');
  }
}
