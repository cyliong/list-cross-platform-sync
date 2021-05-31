import 'package:cloud_firestore/cloud_firestore.dart';

class ListItem {
  static const _titleField = 'title';
  static const createdField = 'created';

  String? id;
  String title;
  Timestamp created;

  ListItem({
    this.id,
    required this.title,
    required this.created,
  });

  ListItem.fromMap(Map<String, Object?> map, String id)
      : this(
          id: id,
          title: map[_titleField] as String,
          created: map[createdField] as Timestamp,
        );

  Map<String, Object?> toMap() => {
        _titleField: title,
        createdField: created,
      };
}
