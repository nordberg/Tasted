import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:tasted/screens/feed_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthBloc>.value(value: AuthBloc()),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text("Tasted"),
          ),
          body: LoginForm()),
    );
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
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final AuthBloc _authBloc = Provider.of<AuthBloc>(context);
    return Form(
        key: _loginFormKey,
        child: Column(
          children: <Widget>[
            EmailInput(),
            PasswordInput(),
            RaisedButton(
              color: Colors.amberAccent,
              onPressed: () {
                if (_loginFormKey.currentState.validate()) {
                  // _handleSignIn(_authBloc.email, _authBloc.password);
                  _handleSignIn(_authBloc.email, _authBloc.password)
                      .then((FirebaseUser user) => this.onSuccesfulLogin(user))
                      .catchError((e) {
                        log('Failed to authenticate ${_authBloc.email}');
                        _authBloc.errorMsg = 'Failed to authenticate.';
                  });
                }
              },
              child: Text("Login"),
            ),
            Text(_authBloc.errorMsg),
          ],
        ));
  }

  void onSuccesfulLogin(FirebaseUser user) {
    log('Succesfully authenticated ${user.email}');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Feed())
    );  // TODO: This gives a "back" action to the login page...
  }

  Future<FirebaseUser> _handleSignIn(String email, String password) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password));
    return user;
  }
}

class EmailInput extends StatefulWidget {
  EmailInput();

  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _authBloc = Provider.of<AuthBloc>(context);

    emailController.addListener(() {
      emailController.addListener(() {
        _authBloc.email = emailController.text;
      });
    });

    return TextFormField(
      decoration: InputDecoration(icon: Icon(Icons.email), labelText: 'Email'),
      validator: (value) {
        if (value.isEmpty) {
          return 'No email provided';
        }
        return null;
      },
      controller: emailController,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}

class PasswordInput extends StatefulWidget {
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _authBloc = Provider.of<AuthBloc>(context);
    passwordController.addListener(() {
      _authBloc.password = passwordController.text;
    });

    return TextFormField(
      decoration:
          InputDecoration(icon: Icon(Icons.lock), labelText: 'Password'),
      obscureText: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'No password provided';
        }
        return null;
      },
      controller: passwordController,
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}

class AuthBloc extends ChangeNotifier {
  String _email = '';
  String _password = '';
  String _errorMsg = '';

  String get email => _email;

  String get password => _password;

  String get errorMsg => _errorMsg;

  set password(String val) {
    _password = val;
    notifyListeners();
  }

  set email(String val) {
    _email = val;
    notifyListeners();
  }

  set errorMsg(String val) {
    _errorMsg = val;
    notifyListeners();
  }
}
