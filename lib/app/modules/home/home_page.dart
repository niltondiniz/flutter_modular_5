import 'package:cache_image/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_5/app/modules/home/components/item/item_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: controller.setText,
        ),
        actions: <Widget>[
          Observer(builder: (_) {
            return IconButton(
              icon: Icon(Icons.add),
              onPressed: controller.text.isEmpty ? null : controller.save,
            );
          })
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (_, index) {
              return ItemWidget(
                index: index,
              );
            },
          );
        },
      ),
    );
  }
}
