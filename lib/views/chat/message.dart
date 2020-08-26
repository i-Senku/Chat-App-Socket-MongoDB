import 'dart:convert';
import 'package:chat/viewmodel/chat/chat_view_model.dart';
import 'package:chat/views/chat/hero_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessage extends StatelessWidget {
  final ChatViewModel message;
  ChatMessage({this.message, bool isMy});

  @override
  Widget build(BuildContext context) {
    if (message.isImage) {
      return buildImage(context);
    } else {
      return buildText(context);
    }
  }

  Widget buildImage(BuildContext context) {
    return Align(
      alignment: message.isMy ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
             crossAxisAlignment:message.isMy ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HeroImage(imageProvider: MemoryImage(base64Decode(message.content))))),
              child: Container(
                decoration: BoxDecoration(
                  color: message.isMy ? Color(0xFF1289FD) : Color(0xFFE5E4EA),
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                    width: 300,
                    height: 250,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                          fit: BoxFit.cover, image: MemoryImage(base64Decode(message.content))),
                    borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                ),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8,left: 12, right: 12),
              child: Text(DateFormat('HH:mm').format(DateTime.parse(message.createdAt)),style: TextStyle(color: Colors.blueGrey,fontSize: 14,fontWeight: FontWeight.w500)),
            )
          ],
        ),
      )
    );
  }

  Widget buildText(BuildContext context) {
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
                  color: message.isMy ? Color(0xFF1289FD) : Color(0xFFE5E4EA)),
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              child: message.isImage
                  ? Image.memory(base64Decode(message.content))
                  : Text(message.content,
                      style: TextStyle(color: message.isMy ? Colors.white : Colors.black)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12,bottom: 4),
              child: Text(DateFormat('HH:mm')
                  .format(DateTime.parse(message.createdAt)),style: TextStyle(color: Colors.blueGrey,fontSize: 14,fontWeight: FontWeight.w500),),
            )
          ],
        ),
      ),
    );
  }
}
