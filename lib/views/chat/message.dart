import 'dart:convert';
import 'dart:io' as Io;
import 'dart:typed_data';
import 'package:chat/viewmodel/chat/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessage extends StatelessWidget {
  final ChatViewModel message;
  ChatMessage({this.message, bool isMy});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMy ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.85),
        child: Column(
          crossAxisAlignment:
              message.isMy ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: message.isMy ? Colors.deepOrange : Colors.blue),
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              child:
                  message.isImage ? Image.memory(base64Decode(message.content)) : Text(message.content, style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Text(DateFormat('HH:mm')
                  .format(DateTime.parse(message.createdAt))),
            )
          ],
        ),
      ),
    );
  }
}
