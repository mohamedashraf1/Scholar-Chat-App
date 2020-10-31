import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message extends StatefulWidget {
  final String senderID;
  final String content;
  final Timestamp time;

  Message({this.senderID, this.content, this.time});

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  String name;

  Future<String> getName() async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    final snapshot = await users.doc(widget.senderID).get().then((value) {
      if (mounted)
        setState(() {
          name = value.data()['name'];
        });
    });
    try {
      if (snapshot != null)
        return snapshot.data()['name'];
      else
        return null;
    } catch (e) {
      print("************");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getName();
    return Container(
      constraints: BoxConstraints(
        maxWidth: 250,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name == null ? "fetching" : "$name",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "${widget.content}",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                "${widget.time.toDate().toString()}",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
