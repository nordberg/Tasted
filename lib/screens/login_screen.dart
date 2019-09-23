import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  _handleSignIn();
                }
              },
              child: Text("Login"),
            )
          ],
        ));
  }

  Future<FirebaseUser> _handleSignIn() async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(email: loginController.text, password: 'abc123'));
    print('Signed in ' + user.email);
    return user;
  }
}

class EmailInput extends StatelessWidget {
  final TextEditingController loginController;

  EmailInput({this.loginController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Email'
      ),
      controller: this.loginController,
      validator: (value) {
        if (value.isEmpty) {
          return 'No email provided';
        }
        return null;
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Password'
      ),
      obscureText: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'No password provided';
        }
        return null;
      },
    );
  }
}
