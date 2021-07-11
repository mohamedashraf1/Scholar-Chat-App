import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/message.dart';

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<List<Message>>(context);

    messages.sort((a, b) => a.time.compareTo(b.time));

    return messages == null
        ? Container()
        : ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Message(
                content: messages[index].content,
                senderID: messages[index].senderID,
                time: messages[index].time,
              );
            },
          );
  }
}
