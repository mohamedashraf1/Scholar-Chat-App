import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CollectionReference messages =
      FirebaseFirestore.instance.collection("Messages");

  //collection reference
  final CollectionReference users =
      FirebaseFirestore.instance.collection("Users");

  Future addNewUser(String name) async {
    return await users.doc(uid).set({
      'name': name,
    });
  }

  Stream<QuerySnapshot> get theFullMessages {
    return messages.snapshots();
  }

  Future<void> addNewMessage({String id, String content, String time}) {
    try {
      print("in");
      return messages
          .doc()
          .set({
            'SenderID': id,
            'content': content,
            'time': time,
          })
          .then((value) => print("message added"))
          .catchError(() => print("failed************"));
    } catch (e) {
      print(e);
      print("-----------------");
      return null;
    }
  }
}
