import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final _firebaseAuth = FirebaseAuth.instance;

  String? get currentUserId => _firebaseAuth.currentUser?.uid;

  static final _instance = AuthenticationService._();
  factory AuthenticationService() => _instance;
  AuthenticationService._();

  Future<String?> signUp(
      {required String email, required String password}) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user?.uid;
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user?.uid;
  }

  Future<void> signOut() => _firebaseAuth.signOut();
}
