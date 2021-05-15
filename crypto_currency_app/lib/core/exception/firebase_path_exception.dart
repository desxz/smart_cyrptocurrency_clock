import '../../feature/login_register/service/firebase_authentication_service.dart';

class FirebaseDatabaseServicePathNotDefinedException implements Exception {
  FirebaseDatabaseServicePathNotDefinedException(
      FirebaseDatabasePath firebaseDatabasePath);

  @override
  String toString() {
    return 'Firebase Database Service Path Not Defined!';
  }
}
