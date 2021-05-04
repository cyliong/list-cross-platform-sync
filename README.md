# list-cross-platform-sync
This is a simple cross-platform list mobile app 
(to-do list, tasks, shopping list, recipes, and the like) 
written in Dart using the Flutter framework, 
for both Android and iOS platforms.

It showcases the implementation of CRUD operations 
with various Flutter programming techniques and patterns, including:
- Integration with Firebase services (Authentication, Cloud Firestore)
- Asynchronous programming with `Future`, `async` and `await`
- Singleton pattern with factory constructor
- Sound null safety

## Features
- Create user account with email and password 
  (`FirebaseAuth`'s `createUserWithEmailAndPassword()`)
- Log in to an existing account with email and password 
  (`FirebaseAuth`'s `signInWithEmailAndPassword()`)
- Display a list of items 
  (`FutureBuilder`, `ListView`, `ListTile`, `QueryDocumentSnapshot`)
- Input dialog for adding and editing items 
  (`AlertDialog`, `CollectionReference`'s `add()`, 
  `DocumentReference`'s `update()`)
- Swipe to delete items 
  (`Dismissible`, `DocumentReference`'s `delete()`)
- Store items on a NoSQL cloud database (Cloud Firestore)

## Dependencies
- firebase_core
- cloud_firestore
- firebase_auth

## Requirements
- Flutter 2.0.6 or higher
- Dart 2.12.0 or higher
