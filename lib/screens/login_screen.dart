
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Tasted"),
      ),
      body: Column(
        children: <Widget>[
          Icon(Icons.fastfood),
          EmailInput(),
          PasswordInput(),
          LoginButton()
        ],
      ),
    );
  }

}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.email),
      ),
      initialValue: "Email",
    );
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
      ),
      initialValue: "Password",
      obscureText: true,
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.amberAccent,
      onPressed: () {

      },
      child: Text("Login"),
    );
  }

}