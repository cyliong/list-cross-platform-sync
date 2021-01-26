import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:items/model/list_item.dart';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  Future<List<ListItem>> get items async {
    final querySnapshot = await _firestore.collection('items').get();
    return querySnapshot.docs
        .map((snapshot) => ListItem.fromMap(snapshot.data(), snapshot.id))
        .toList();
  }
}
