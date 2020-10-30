import 'package:flutter/material.dart';

import '../services/auth.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String _email;
  String _name;
  String _password;

  final formKey = GlobalKey<FormState>();

  AuthService _authService = AuthService();

  var isSignedUp = false;

  Future _submit() async {
    if (formKey.currentState.validate()) {
      dynamic result = await _authService.signUp(
        email: _email,
        password: _password,
      );
      if (result == null) {
        print("error");
      } else
        isSignedUp = true;
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
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign Up",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: decorate("Name"),
            style: TextStyle(color: Theme.of(context).primaryColor),
            validator: (value) => value == "" ? "You must enter a name" : null,
            onChanged: (value) => _name = value,
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
                if (isSignedUp) Navigator.pop(context);
              },
              child: Text(
                "Sign Up",
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
                  "already have an account ?",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    "Sing In",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
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
