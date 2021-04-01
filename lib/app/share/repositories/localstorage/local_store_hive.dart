import 'dart:async';

import 'package:flutter_modular_5/app/share/repositories/localstorage/local_storage_interface.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalStoreHive implements ILocalStorage {
  Completer _instance = Completer<Box>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    var box = await Hive.openBox('db');
    _instance.complete(box);
  }

  LocalStoreHive() {
    _init();
  }

  @override
  Future delete(String key) async {
    var box = await _instance.future;
    box.delete(key);
  }

  @override
  Future<List<String>> get(String key) async {
    var box = await _instance.future;
    return box.get(key);
  }

  @override
  Future put(String key, List<String> values) async {
    var box = await _instance.future;
    box.put(key, values);
  }
}
