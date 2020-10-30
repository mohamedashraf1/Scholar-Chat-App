import 'package:ScholarChatApp/Screens/signupPage.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  String _email;
  String _password;

  final _formKey = GlobalKey<FormState>();

  final AuthService _authService = AuthService();
  Future _submit() async {
    if (_formKey.currentState.validate()) {
      await _authService.signIn(
        email: _email,
        password: _password,
      );
    }
  }

  InputDecoration decorate(name) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2,
          )),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).errorColor,
          )),
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Theme.of(context).primaryColor),
      labelText: name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign In",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: decorate("Email"),
            style: TextStyle(color: Theme.of(context).primaryColor),
            validator: (value) =>
                !value.contains("@") ? "Not a valid Email" : null,
            onChanged: (value) => _email = value,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: decorate("Password"),
            style: TextStyle(color: Theme.of(context).primaryColor),
            obscureText: true,
            validator: (value) =>
                value.length < 8 ? "You need at least 8 Charachters" : null,
            onChanged: (value) => _password = value,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).accentColor,
              onPressed: () async {
                await _submit();
              },
              child: Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "don't have an account ?",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    "Sing Up",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Scaffold(
                          body: SignUpPage(),
                        );
                      },
                    ));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
