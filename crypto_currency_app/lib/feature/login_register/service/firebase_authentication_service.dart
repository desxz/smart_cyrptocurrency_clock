import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  static AuthenticationService? _instance;
  static AuthenticationService get instance =>
      _instance ??= AuthenticationService._init();
  AuthenticationService._init();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<User?>? signIn(String email, String passwd) async {
    var user =
        await _auth.signInWithEmailAndPassword(email: email, password: passwd);
    return user.user;
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }

  Future<User?>? signUp(String email, String passwd) async {
    UserCredential? user = await _auth.createUserWithEmailAndPassword(
        email: email, password: passwd);

    if (user.user != null) {
      await _firestore.collection('User').doc(user.user!.uid).set({
        'email': email,
        'password': passwd,
      });
      return user.user;
    }
  }
}
