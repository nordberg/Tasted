import 'package:flutter/material.dart';

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
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Logging in...')));
                }
              },
              child: Text("Login"),
            )
          ],
        ));
  }
}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Email'
      ),
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
