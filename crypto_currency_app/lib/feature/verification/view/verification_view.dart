import 'package:crypto_currency_app/core/constants/navigation/navigation_constants.dart';
import 'package:crypto_currency_app/core/init/navigation/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'Verify mail sent your email address! Please verify your account.'),
          Text('If verify your account tab the button.'),
          TextButton(
            onPressed: () {
              _auth.currentUser!.reload();
              if (_auth.currentUser != null &&
                  _auth.currentUser!.emailVerified) {
                NavigationService.instance
                    .navigateToPage(path: NavigationConstants.TAB_VIEW);
                print(_auth.currentUser.toString());
              } else if (_auth.currentUser == null) {
                print('USER YOK!');
              }
            },
            child: Text('Home Screen'),
          ),
          TextButton(
              onPressed: () {
                if (_auth.currentUser != null &&
                    !_auth.currentUser!.emailVerified) {
                  _auth.currentUser!.sendEmailVerification();
                }
              },
              child: Text('Send again!'))
        ],
      ),
    );
  }
}
