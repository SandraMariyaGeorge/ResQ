import 'package:firebase_auth/firebase_auth.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? getcurrentUser() {
    return _auth.currentUser;
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

}