import 'package:crypto_currency_app/feature/login_register/service/firebase_authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('Your account is not verified!\n'),
          ),
          TextButton(
              onPressed: () {
                if (_auth.currentUser != null) {
                  AuthenticationService.instance
                      .sendEmailVerification(_auth.currentUser!);
                }
              },
              child: Text('Verify Email')),
        ],
      ),
    );
  }
}
