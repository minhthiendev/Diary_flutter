import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

// constructor
  // UserAuth({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
  //     : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
  //       _googleSignIn = googleSignIn ?? GoogleSignIn();

  Future signIn() async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInAnonymously();
      return userCredential;
    } catch (e) {}
  }

  Future<void> login(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(), password: password);
  }

  Future<void> register(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(), password: password);
  }

  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }

  Future<bool> isSignedIn() async {
    return await _firebaseAuth.currentUser != null;
  }

  Future<FirebaseUser> getUser() async {
    return await _firebaseAuth.currentUser;
  }
}
