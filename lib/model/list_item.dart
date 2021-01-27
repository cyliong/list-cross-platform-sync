class ListItem {
  static const _titleField = 'title';

  String id;
  String title;

  ListItem({
    this.id,
    this.title,
  });

  ListItem.fromMap(Map<String, dynamic> map, String id) {
    this.id = id;
    this.title = map[_titleField];
  }
}
