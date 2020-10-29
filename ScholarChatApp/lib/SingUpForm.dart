import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void _submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
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
            decoration: decorate("Name"),
            style: TextStyle(color: Theme.of(context).primaryColor),
            validator: (value) =>
                value == null ? "You must enter a name" : null,
            controller: _nameController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: decorate("Email"),
            style: TextStyle(color: Theme.of(context).primaryColor),
            validator: (value) =>
                !value.contains("@") ? "Not a valid Email" : null,
            controller: _emailController,
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
            controller: _passwordController,
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
              onPressed: _submit,
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
