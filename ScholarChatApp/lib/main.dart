import 'package:flutter/material.dart';

import './signInPage.dart';

main(List<String> args) {
  runApp(ScholarChatApp());
}

class ScholarChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SignInPage(),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color.fromRGBO(43, 71, 93, 1),
      ),
    );
  }
}
