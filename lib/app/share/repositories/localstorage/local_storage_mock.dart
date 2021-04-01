import 'package:flutter_modular_5/app/share/repositories/localstorage/local_storage_interface.dart';

class LocalStorageMock implements ILocalStorage {
  List<String> storage = [];

  @override
  Future delete(String key) {
    return null;
  }

  @override
  Future<List<String>> get(String key) async {
    return storage;
  }

  @override
  Future put(String key, List<String> values) async {
    storage = values;
  }
}
