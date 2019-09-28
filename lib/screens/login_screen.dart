import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthBloc>.value(
          value: AuthBloc()
        ),
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
                  _handleSignIn(_authBloc.email, _authBloc.password);
                }
              },
              child: Text("Login"),
            )
          ],
        ));
  }

  Future<FirebaseUser> _handleSignIn(String email, String password) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(email: email, password: password));
    print('Signed in ' + user.email);
    return user;
  }
}

class EmailInput extends StatelessWidget {
  EmailInput();

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = Provider.of<AuthBloc>(context);

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
      onChanged: (value) {
        authBloc.email = value;
      },
    );
  }
}

class AuthBloc extends ChangeNotifier {
  String _email = '';
  String _password = '';
  String get email => _email;
  String get password => _password;

  set password(String val) {
    _password = val;
    notifyListeners();
  }

  set email(String val) {
    _email = val;
    notifyListeners();
  }
}

class PasswordInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = Provider.of<AuthBloc>(context);

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
      onChanged: (value) {
        authBloc.password = value;
      },
    );
  }
}
