import 'package:firebase_auth/firebase_auth.dart';

import '../models/User.dart';
import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser _userFromFirebaseUser(User user) {
    return user != null
        ? MyUser(
            name: user.displayName,
            uid: user.uid,
          )
        : null;
  }

  //auth change user stream
  Stream<MyUser> get getUser {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign up
  Future signUp({String email, String password, String name}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = result.user;
      // create a new doc for the user with the uid
      await DatabaseService(uid: user.uid).addNewUser(name);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign up
  Future signIn({String email, String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print("hiiiiiiiiiiiiiiiiiiiiii");
      print(e);
      return null;
    }
  }

  //sign out
  Future logOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
