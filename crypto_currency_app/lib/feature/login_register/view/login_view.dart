import 'package:crypto_currency_app/core/constants/navigation/navigation_constants.dart';
import 'package:crypto_currency_app/core/init/navigation/navigation_service.dart';
import 'package:crypto_currency_app/feature/login_register/service/firebase_authentication_service.dart';
import 'package:crypto_currency_app/feature/login_register/viewmodel/login_register_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _auth.signOut();
  }

  late String _email;
  late String _passwd;

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
              alignment: WrapAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                    if (value != null && value.isValidEmail()) {
                      _email = value;
                    } else {
                      return 'Check your email address!';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'youremail@gmail.com',
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value != null || value!.isValidPassword()) {
                      _passwd = value;
                    } else {
                      return 'Check your password';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Your Password',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await AuthenticationService.instance
                          .signIn(_email, _passwd);
                      if (_auth.currentUser!.emailVerified) {
                        await NavigationService.instance
                            .navigateToPage(path: NavigationConstants.TAB_VIEW);
                      } else {
                        await NavigationService.instance.navigateToPage(
                            path: NavigationConstants.VERIFICATION_VIEW);
                      }
                    }
                  },
                  child: Text('LOGIN'),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have any account?'),
                    InkWell(
                      onTap: () => NavigationService.instance.navigateToPage(
                          path: NavigationConstants.REGISTER_VIEW),
                      child: Text(
                        'Sign up',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
