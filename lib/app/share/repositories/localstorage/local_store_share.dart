import 'dart:async';

import 'package:flutter_modular_5/app/share/repositories/localstorage/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStoreShared implements ILocalStorage {
  Completer<SharedPreferences> _instance = Completer<SharedPreferences>();

  _init() async {
    _instance.complete(await SharedPreferences.getInstance());
  }

  LocalStoreShared() {
    _init();
  }

  @override
  Future delete(String key) async {
    var share = await _instance.future;
    share.remove(key);
  }

  @override
  Future<List<String>> get(String key) async {
    var share = await _instance.future;
    return share.getStringList(key);
  }

  @override
  Future put(String key, List<String> values) async {
    var share = await _instance.future;
    share.setStringList(key, values);
  }
}
