import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('New Item'),
        content: TextField(
          autofocus: true,
          decoration: InputDecoration(hintText: 'Add title'),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {},
          ),
          TextButton(
            child: Text('Save'),
            onPressed: () {},
          )
        ]);
  }
}
