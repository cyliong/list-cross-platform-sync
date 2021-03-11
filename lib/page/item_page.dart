// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:items/model/list_item.dart';
import 'package:items/service/database_service.dart';

class ItemPage extends StatefulWidget {
  final ListItem item;
  final bool isNew;

  ItemPage({this.item}) : isNew = item == null;

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.item?.title;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('${widget.isNew ? 'New' : 'Edit'} Item'),
        content: TextField(
          controller: _titleController,
          autofocus: true,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(hintText: 'Add title'),
          onSubmitted: (_) => _save(context),
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
    final text = _titleController.text;
    if (text?.trim()?.isEmpty ?? true) return;

    var item;
    if (widget.isNew) {
      item = ListItem(
        title: text,
        created: Timestamp.now(),
      );
      await DatabaseService().addItem(item);
    } else {
      item = widget.item..title = text;
      await DatabaseService().updateItem(item);
    }
    Navigator.pop(context, item);
  }
}
