import 'package:flutter/material.dart';

import './SingUpForm.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        height: media,
        color: Theme.of(context).accentColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/graduation-cap.png',
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    "Scholar Chat",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).primaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
              width: double.infinity,
              child: SignUpForm(),
            ),
          ],
        ),
      ),
    );
  }
}
