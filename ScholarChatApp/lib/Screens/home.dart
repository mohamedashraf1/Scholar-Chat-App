import 'package:flutter/material.dart';

import '../services/auth.dart';

class MyHomePage extends StatelessWidget {
  final AuthService _authService = AuthService();
  var _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/graduation-cap.png",
                width: 60,
                height: 60,
              ),
              Text(
                "Chat",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
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
      body: TextFormField(
        decoration: InputDecoration(
            hintText: "Enter your message",
            hintStyle: TextStyle(color: Theme.of(context).accentColor),
            suffixIcon: GestureDetector(
              child: Icon(
                Icons.send,
                color: Theme.of(context).accentColor,
              ),
              onTap: () {
                _textController.clear();
                FocusScope.of(context).unfocus();
              },
            )),
        style: TextStyle(color: Theme.of(context).accentColor),
        controller: _textController,
      ),
    );
  }
}
