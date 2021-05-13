import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthenticationService {
  static AuthenticationService? _instance;
  static AuthenticationService get instance =>
      _instance ??= AuthenticationService._init();
  AuthenticationService._init();

  final _auth = FirebaseAuth.instance;
  //final _firestore = FirebaseFirestore.instance;
  final _realTimeDatabase = FirebaseDatabase.instance.reference();

  Future<User?>? signIn(String email, String passwd) async {
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: passwd);
      return user.user;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      if (_auth.currentUser != null) return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<User?>? signUp(
      String email, String passwd, String name, String surname, String) async {
    try {
      UserCredential? user = await _auth.createUserWithEmailAndPassword(
          email: email, password: passwd);

      if (_auth.currentUser != null) {
        await sendEmailVerification(user.user!);
        await _auth.signOut();
      }

      if (user.user != null) {
        await _realTimeDatabase.child('Users').child(user.user!.uid).set(
          {
            'coins': [],
            'alarms': {},
            'name': '',
            'surname': '',
            'e-mail_address': '',
            'device_id': 0,
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> sendEmailVerification(User user) async {
    await user.sendEmailVerification();
  }

  Future<void> forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
