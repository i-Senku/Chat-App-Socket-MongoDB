import 'package:chat/viewmodel/shuffle/shuffle_view_model_list.dart';
import 'package:chat/views/shuffle/card.dart';
import 'package:flutter/material.dart';


class ShuffleList extends StatelessWidget {
  
  final ShufListState shuffleVM;
  ShuffleList({@required this.shuffleVM});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shuffleVM.userList.length,
      itemBuilder: (context,index){
        return ShuffleCard(user: shuffleVM.userList[index],);
      },
    );
  }

}