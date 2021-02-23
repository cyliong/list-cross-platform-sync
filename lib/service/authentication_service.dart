import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<String> signUp({String email, String password}) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user.uid;
  }

  Future<String> signIn({String email, String password}) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user.uid;
  }

  Future<void> signOut() => _firebaseAuth.signOut();
}
