import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../core/exception/firebase_path_exception.dart';
import '../model/user_model.dart';

class AuthenticationService {
  static AuthenticationService? _instance;
  static AuthenticationService get instance =>
      _instance ??= AuthenticationService._init();
  AuthenticationService._init();

  final _auth = FirebaseAuth.instance;
  //final _firestore = FirebaseFirestore.instance;
  static FirebaseApp _firebaseApp = Firebase.app();

  final _dio = Dio(
    BaseOptions(baseUrl: FirebaseDatabasePath.BASE_URL.rawValue),
  );

  final _userRef = FirebaseDatabase.instance.reference().child('Users');
  final FirebaseDatabase database = FirebaseDatabase(app: _firebaseApp);
  Future<User?>? signIn(String email, String passwd) async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: passwd);

      var user = userCredential.user;
      if (user != null) {
        return user;
      }
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

  Future<User?>? signUp(UserModel userModel) async {
    try {
      UserCredential? userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userModel.email.toString(),
              password: userModel.password.toString());
      User? user;
      user = userCredential.user;

      if (user != null) {
        print('TEST');
        await sendEmailVerification(user);
        await realTimeDatabasePostUserWithDio(user, userModel);
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

  Future<void> removeAccountPermanently(User user) async {
    await user.delete();
    await _userRef.child(user.uid).remove();
  }

  Future<bool> realTimeDatabasePostUserWithDio(
      User user, UserModel userModel) async {
    final postDataResponse = await _dio.post(
        FirebaseDatabasePath.USER_POST.rawValue + '${user.uid}.json',
        data: userModel);

    if (postDataResponse.statusCode == HttpStatus.ok) {
      return true;
    }
    return false;
  }
}

enum FirebaseDatabasePath {
  BASE_URL,
  USERS,
  USER_POST,
}

extension FirebaseDatabasePathExtension on FirebaseDatabasePath {
  String get rawValue {
    switch (this) {
      case FirebaseDatabasePath.BASE_URL:
        return 'https://crypto-currency-75f19-default-rtdb.europe-west1.firebasedatabase.app';
      case FirebaseDatabasePath.USERS:
        return '/Users.json';
      case FirebaseDatabasePath.USER_POST:
        return '/Users/';
      default:
        throw FirebaseDatabaseServicePathNotDefinedException(this);
    }
  }
}
