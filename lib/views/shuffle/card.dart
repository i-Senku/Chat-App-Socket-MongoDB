import 'package:chat/service/service_manager.dart';
import 'package:chat/viewmodel/chat/chat_view_model_list.dart';
import 'package:chat/viewmodel/shuffle/shuffle_view_model.dart';
import 'package:chat/views/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:chat/main.dart';


class ShuffleCard extends StatelessWidget {
  final ShuffleViewModel _user;
  ShuffleCard({ShuffleViewModel user}) : this._user = user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        getIt<ChatListState>().messageList.clear();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatView(receiverID: _user.id,clientName: _user.name,)));
        await ServiceManager.shared.fetchMessageList(_user.id);
      },
      child: Card(
        child: ListTile(
          title: Text(_user.name),
          leading: Icon(Icons.supervised_user_circle),
        ),
      ),
    );
  }
}
