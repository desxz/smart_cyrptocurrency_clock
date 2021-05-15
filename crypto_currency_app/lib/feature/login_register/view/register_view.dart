import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../model/user_model.dart';
import '../service/firebase_authentication_service.dart';
import '../viewmodel/login_register_view_model.dart';

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

  UserModel userModel =
      UserModel(name: '', deviceId: '', password: '', email: '', surname: '');

  @override
  void initState() {
    super.initState();

    _auth.signOut();
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
              alignment: WrapAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _nameController,
                  validator: (value) {
                    if (value != null && value.isValidNameSurname()) {
                      userModel.name = value;
                      print(userModel.name);
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
                      userModel.surname = value;
                      print(userModel.surname);
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
                      userModel.email = value;
                      print(userModel.email);
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
                    if (value != null && value.isValidPassword()) {
                      userModel.password = value;
                      print(userModel.password);
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
                      userModel.deviceId = '0';
                    } else {
                      userModel.deviceId = value;
                      print(userModel.deviceId);
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
                      print('EXE');
                      await AuthenticationService.instance.signUp(userModel);
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
