import 'package:crypto_currency_app/feature/login_register/model/user_model.dart';
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

  Future<User?>? signUp(UserModel userModel, User? currentUser) async {
    try {
      UserCredential? user = await _auth.createUserWithEmailAndPassword(
          email: userModel.email.toString(),
          password: userModel.password.toString());

      if (_auth.currentUser != null) {
        print('TEST');
        await createData(userModel, user.user!);
        await sendEmailVerification(user.user!);
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

  Future<void> createData(UserModel userModel, User user) async {
    await _realTimeDatabase
        .child(
            '${userModel.name} + ${userModel.surname} + ${userModel.deviceId}')
        .set(
      {
        'name': userModel.name,
      },
    );
  }
}
