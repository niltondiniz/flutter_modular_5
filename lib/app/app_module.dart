import 'package:flutter_modular_5/app/share/repositories/localstorage/local_storage_interface.dart';
import 'package:flutter_modular_5/app/share/repositories/localstorage/local_store_share.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular_5/app/app_widget.dart';
import 'package:flutter_modular_5/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind<ILocalStorage>((i) => LocalStoreShared()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
