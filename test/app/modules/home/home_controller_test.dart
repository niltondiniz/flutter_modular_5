import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_modular_5/app/share/repositories/localstorage/local_storage_interface.dart';
import 'package:flutter_modular_5/app/share/repositories/localstorage/local_storage_mock.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_modular_5/app/modules/home/home_controller.dart';
import 'package:flutter_modular_5/app/modules/home/home_module.dart';

import '../../../../lib/app/app_module.dart';

void main() {
  initModule(AppModule(), changeBinds: [
    Bind<ILocalStorage>((i) => LocalStorageMock()),
  ]);
  initModule(HomeModule());
  HomeController home;
  //
  setUp(() {
    home = HomeModule.to.get<HomeController>();
  });

  group('HomeController Test', () {
    test("First Test", () {
      expect(home, isInstanceOf<HomeController>());
    });

    test("Setting Text", () {
      expect(home.text, "");
      home.setText("Setando");
      expect(home.text, "Setando");
    });

    test("Saving Item", () {
      home.setText("TextoAleatorio");
      home.save();
      expect(home.list.length, 1);
      expect(home.list[0], "TextoAleatorio");
    });

    test("Remove", () {
      home.setText("TextoAleatorio");
      home.save();
      home.remove(0);
      expect(home.list.length, 1);
    });
  });
}
