import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/wrapper.dart';
import './services/auth.dart';
import './models/User.dart';

main(List<String> args) {
  runApp(ScholarChatApp());
}

class ScholarChatApp extends StatefulWidget {
  @override
  _ScholarChatAppState createState() => _ScholarChatAppState();
}

class _ScholarChatAppState extends State<ScholarChatApp> {
  bool _initialized = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // if Firebase initialization fails
      print(e.toString());
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _initialized
        ? StreamProvider<MyUser>.value(
            value: AuthService().getUser,
            child: MaterialApp(
              home: Wrapper(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: Colors.white,
                accentColor: Color.fromRGBO(43, 71, 93, 1),
              ),
            ),
          )
        : MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).accentColor),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          );
  }
}
