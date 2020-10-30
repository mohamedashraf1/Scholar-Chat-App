import 'package:flutter/material.dart';

import '../services/auth.dart';

class MyHomePage extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("My home page"),
        textTheme: TextTheme(
            headline6: TextStyle(
          color: Theme.of(context).primaryColor,
        )),
        backgroundColor: Theme.of(context).accentColor,
        actions: [
          FlatButton.icon(
            onPressed: () async {
              await _authService.logOut();
            },
            icon: Icon(
              Icons.person,
              color: Theme.of(context).primaryColor,
            ),
            label: Text(
              "logout",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
