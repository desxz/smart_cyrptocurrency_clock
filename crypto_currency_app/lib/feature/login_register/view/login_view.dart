import 'package:crypto_currency_app/core/constants/navigation/navigation_constants.dart';
import 'package:crypto_currency_app/core/init/navigation/navigation_service.dart';
import 'package:crypto_currency_app/feature/login_register/viewmodel/login_register_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final LoginRegisterViewModel _loginRegisterViewModel =
      LoginRegisterViewModel();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User sign out!');
      } else {
        print('User signed in');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              runSpacing: 20,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) => value!.isValidEmail()
                      ? null
                      : 'Check your email address!',
                  decoration: InputDecoration(
                    hintText: 'youremail@gmail.com',
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      NavigationService.instance
                          .navigateToPage(path: NavigationConstants.TAB_VIEW);
                    }
                  },
                  child: Text('BUTTON'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
