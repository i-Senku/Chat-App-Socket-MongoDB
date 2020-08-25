import 'package:chat/viewmodel/shuffle/shuffle_view_model_list.dart';
import 'package:chat/views/shuffle/card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShuffleList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var shuffleVM = Provider.of<ShuffleListVM>(context);
    return ListView.builder(
      itemCount: shuffleVM.userList.length,
      itemBuilder: (context,index){
        return ShuffleCard(user: shuffleVM.userList[index],);
      },
    );
  }

}