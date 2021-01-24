import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  CollectionReference get items {
    return _firestore.collection('items');
  }
}
