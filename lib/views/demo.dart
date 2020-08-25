import 'package:flutter/material.dart';

class DemoList extends StatelessWidget {

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('asdsd'),),
      body: ListView.builder(
        controller: _controller,
        itemCount: 60,
        itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          child: Text('$index Sayı'),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _controller.jumpTo(_controller.position.maxScrollExtent);
      }),
    );
  }
}