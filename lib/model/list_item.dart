class ListItem {
  String id;
  String title;

  ListItem({
    this.id,
    this.title,
  });

  ListItem.fromMap(Map<String, dynamic> map, String id) {
    this.id = id;
    this.title = map['title'];
  }
}
