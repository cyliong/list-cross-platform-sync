import 'package:flutter/material.dart';
import 'package:items/model/list_item.dart';
import 'package:items/service/database_service.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('New Item'),
        content: TextField(
          controller: _controller,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Add title'),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('Save'),
            onPressed: () => _save(context),
          )
        ]);
  }

  void _save(BuildContext context) async {
    final text = _controller.text;
    if (text?.trim()?.isEmpty ?? true) return;

    final item = ListItem(title: text);
    await DatabaseService().addItem(item);
    Navigator.pop(context, item);
  }
}
