import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference users =
      FirebaseFirestore.instance.collection("Users");

  final CollectionReference messages =
      FirebaseFirestore.instance.collection("Messages");

  Future addNewUser(String name) async {
    return await users.doc(uid).set({
      'name': name,
    });
  }
}
