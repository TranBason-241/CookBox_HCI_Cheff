import 'package:flutter/material.dart';

class ListItemByCat extends StatelessWidget {
  const ListItemByCat({Key? key}) : super(key: key);
  static const routeName = '/listItemByCat';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Chua custom"),),
    );
  }
}
