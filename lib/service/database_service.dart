import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:items/model/list_item.dart';

class DatabaseService {
  static const _itemsCollection = 'items';

  final _firestore = FirebaseFirestore.instance;

  Future<List<ListItem>> get items async {
    final querySnapshot = await _firestore.collection(_itemsCollection).get();
    return querySnapshot.docs
        .map((snapshot) => ListItem.fromMap(snapshot.data(), snapshot.id))
        .toList();
  }

  Future<void> addItem(ListItem item) async {
    await _firestore.collection(_itemsCollection).add(item.toMap());
  }

  Future<void> deleteItem(ListItem item) async {
    await _firestore.collection(_itemsCollection).doc(item.id).delete();
  }
}
