import 'package:crypto_currency_app/core/constants/navigation/navigation_constants.dart';
import 'package:crypto_currency_app/core/init/navigation/navigation_service.dart';
import 'package:crypto_currency_app/feature/login_register/service/firebase_authentication_service.dart';
import 'package:crypto_currency_app/feature/login_register/viewmodel/login_register_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User sign out!');
      } else {
        print('User signed in');
      }
    });
  }

  late String _name;
  late String _surname;
  late String _email;
  late String _passwd;
  String _device_id = '0';

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
                  keyboardType: TextInputType.text,
                  controller: _nameController,
                  validator: (value) {
                    if (value != null && value.isValidNameSurname()) {
                      _name = value;
                    } else {
                      return 'Check your name!';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Elon',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _surnameController,
                  validator: (value) {
                    if (value != null && value.isValidNameSurname()) {
                      _surname = value;
                    } else {
                      return 'Check your surname!';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Musk',
                    labelText: 'Surname',
                    border: OutlineInputBorder(),
                  ),
                ),
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
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      _device_id = '0';
                    } else {
                      _device_id = value;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Device ID',
                    labelText: 'Device ID',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await AuthenticationService.instance
                          .signUp(_email, _passwd, _name, _surname, _device_id);

                      await NavigationService.instance.navigateToPage(
                          path: NavigationConstants.VERIFICATION_VIEW);
                    }
                  },
                  child: Text('Register'),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    InkWell(
                      onTap: () => NavigationService.instance
                          .navigateToPage(path: NavigationConstants.LOGIN_VIEW),
                      child: Text(
                        'Sign in',
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
