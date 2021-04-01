import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_controller.dart';

class ItemWidget extends StatelessWidget {
  final int index;
  final HomeController controller = Modular.get();

  ItemWidget({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(controller.list[index]),
      leading: Image(
        fit: BoxFit.cover,
        image: CachedNetworkImageProvider(
            "https://images.unsplash.com/photo-1517423440428-a5a00ad493e8"),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.cancel,
          color: Colors.red,
        ),
        onPressed: () {
          controller.remove(index);
        },
      ),
    );
  }
}
