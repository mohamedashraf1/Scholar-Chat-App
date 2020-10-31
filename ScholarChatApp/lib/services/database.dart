import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/message.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CollectionReference messages =
      FirebaseFirestore.instance.collection("MyMessages");

  //collection reference
  final CollectionReference users =
      FirebaseFirestore.instance.collection("Users");

  Future addNewUser(String name) async {
    return await users.doc(uid).set({
      'name': name,
    });
  }

  List<Message> _messageListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Message(
        content: doc.data()['content'] ?? '',
        senderID: doc.data()['SenderID'] ?? '',
        time: doc.data()['time'] ?? '',
      );
    }).toList();
  }

  Stream<List<Message>> get theFullMessages {
    return messages.snapshots().map(_messageListFromSnapshot);
  }

  Future<void> addNewMessage({String id, String content, Timestamp time}) {
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
