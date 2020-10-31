import 'package:ScholarChatApp/Screens/messagesList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../widgets/message.dart';
import '../services/database.dart';

class MyHomePage extends StatelessWidget {
  final AuthService _authService = AuthService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var _textController = TextEditingController();
  String content;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return StreamProvider<List<Message>>.value(
      value: DatabaseService().theFullMessages,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
              onPressed: () {
                _authService.logOut();
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
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: (mediaQuery.size.height -
                        AppBar().preferredSize.height -
                        mediaQuery.padding.top) *
                    0.08,
                child: TextFormField(
                  onChanged: (value) => content = value,
                  decoration: InputDecoration(
                      hintText: "Enter your message",
                      hintStyle:
                          TextStyle(color: Theme.of(context).accentColor),
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.send,
                          color: Theme.of(context).accentColor,
                        ),
                        onTap: () async {
                          User user = _auth.currentUser;
                          print(user.uid);
                          await DatabaseService(
                            uid: user.uid,
                          ).addNewMessage(
                            id: user.uid.toString(),
                            content: content,
                            time: Timestamp.fromDate(DateTime.now()),
                          );

                          _textController.clear();
                          FocusScope.of(context).unfocus();
                        },
                      )),
                  style: TextStyle(color: Theme.of(context).accentColor),
                  controller: _textController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: (mediaQuery.size.height -
                        AppBar().preferredSize.height -
                        mediaQuery.padding.top) *
                    0.88,
                child: MessageList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
