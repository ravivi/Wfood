import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(context),
            ),
          ],
        ),

        body: Center(
          child: Text('Hello Here'),
        ),
      ),
    );
  }
}