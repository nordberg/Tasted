import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasted/main.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tasted"),
        ),
        body: LoginForm());
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();
  final _authBloc = AuthBloc();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _loginFormKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              validator: (val) {
                if (val.isEmpty) {
                  return 'Please enter an email';
                }
                return null;
              },
              onSaved: (val) {
                _authBloc._email = val;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              validator: (val) {
                if (val.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              onSaved: (val) {
                _authBloc._password = val;
              },
            ),
            RaisedButton(
              color: Colors.amberAccent,
              onPressed: () {
                final form = _loginFormKey.currentState;
                if (form.validate()) {
                  form.save();
                  _handleSignIn(_authBloc._email, _authBloc._password)
                      .then((FirebaseUser user) => this.onSuccessfulLogin(user))
                      .catchError((e) {
                    log('Failed to authenticate ${_authBloc._email} due to $e.');
                    _authBloc._errorMsg = 'Failed to authenticate.';
                  });
                }
              },
              child: Text("Login"),
            ),
            Text(_authBloc._errorMsg),
          ],
        ));
  }

  void onSuccessfulLogin(FirebaseUser user) {
    log('Succesfully authenticated ${user.email}');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Feed())
    );
  }

  Future<FirebaseUser> _handleSignIn(String email, String password) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password));
    return user;
  }
}

class AuthBloc {
  String _email = '';
  String _password = '';
  String _errorMsg = '';
}
