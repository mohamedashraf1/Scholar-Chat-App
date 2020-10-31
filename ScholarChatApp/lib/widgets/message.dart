import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String senderID;
  final String content;
  final String time;

  Message({this.senderID, this.content, this.time});

  @override
  Widget build(BuildContext context) {
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
              "$senderID",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "$content",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                "$time",
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
