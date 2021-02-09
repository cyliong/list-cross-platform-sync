import 'package:cloud_firestore/cloud_firestore.dart';

class ListItem {
  static const _titleField = 'title';
  static const createdField = 'created';

  String id;
  String title;
  Timestamp created;

  ListItem({
    this.id,
    this.title,
    this.created,
  });

  ListItem.fromMap(Map<String, dynamic> map, String id) {
    this.id = id;
    this.title = map[_titleField];
    this.created = map[createdField];
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map[_titleField] = title;
    map[createdField] = created;
    return map;
  }
}
