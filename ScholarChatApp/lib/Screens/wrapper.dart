import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/signInPage.dart';
import '../models/User.dart';
import '../Screens/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    return user == null
        ? Scaffold(
            body: SignInPage(),
          )
        : MyHomePage();
  }
}
