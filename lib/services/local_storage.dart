import 'package:localstorage/localstorage.dart';

class LocalStorageService {
  final LocalStorage _storage;

  LocalStorageService(String storageKey) : _storage = LocalStorage(storageKey);

  Future getItem(String key) async {
    await _storage.ready;
    return _storage.getItem(key);
  }

  Future<void> setItem(String key, dynamic value) async {
    await _storage.ready;
    return _storage.setItem(key, value);
  }
}
