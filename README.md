# list-cross-platform-sync
*This project is a work in progress.
More information will be provided when it is ready.*

## Features
- Create user account with email and password 
  (`FirebaseAuth`'s `createUserWithEmailAndPassword()`)
- Log in to an existing account with email and password 
  (`FirebaseAuth`'s `signInWithEmailAndPassword()`)
- Display a list of items 
  (`FutureBuilder`, `ListView`, `ListTile`, `QueryDocumentSnapshot`)
- Input dialog for adding and editing items 
  (`AlertDialog`, `CollectionReference`'s `add()`, `DocumentReference`'s `update()`)
- Swipe to delete items (`Dismissible`, `DocumentReference`'s `delete()`)
- Store items on a NoSQL cloud database (Cloud Firestore)

## Dependencies
- firebase_core
- cloud_firestore
- firebase_auth

## Requirements
- Flutter 2.0.3 or higher
- Dart 2.12.0 or higher
