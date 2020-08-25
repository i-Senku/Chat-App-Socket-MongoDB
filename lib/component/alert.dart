import 'package:flutter/material.dart';

class EGAlert extends StatelessWidget {
  EGAlert({@required this.title,@required this.bodyMessage});
  final String title;
  final String bodyMessage;


  @override
  Widget build(BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(bodyMessage),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Tamam'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
  }
}