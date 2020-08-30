import 'package:chat/core/get_it.dart';
import 'package:chat/service/service_manager.dart';
import 'package:chat/viewmodel/chat/chat_view_model_list.dart';
import 'package:chat/viewmodel/shuffle/shuffle_view_model.dart';
import 'package:chat/views/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:chat/viewmodel/shuffle/shuffle_view_model_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class ShuffleCard extends StatelessWidget {
  final ShuffleViewModel _user;
  final vm = getIt<ShufListState>();
  ShuffleCard({ShuffleViewModel user}) : this._user = user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        getIt<ChatListState>().messageList.clear();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChatView(
                  receiverID: _user.id,
                  clientName: _user.name,
                )));
        await ServiceManager.shared.fetchMessageList(_user.id);
      },
      child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
              color: Colors.white,
              width: double.infinity,
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://yt3.ggpht.com/a/AATXAJymPwE0-PXbFjcJDrZ9unwi5qXZq3dWLB53ha7nwZw=s100-c-k-c0xffffffff-no-rj-mo")),
                                shape: BoxShape.circle,
                                color: Colors.blueGrey),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            _user.name,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Observer(
                              builder: (_) => Container(width: 15,height: 15,
                              decoration: 
                              BoxDecoration(color: vm.onlineUsers.contains(_user.id) ? Colors.green : Colors.red,
                              shape: BoxShape.circle),
                              ),
                          ),
                        ]),
                  ),
                  Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: 0.15,
                  )
                ],
              )),
        ),
    );
  }
}
