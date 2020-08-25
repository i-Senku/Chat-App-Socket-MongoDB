import 'package:chat/core/base_state.dart';
import 'package:chat/helper/preferences_helper.dart';
import 'package:chat/helper/socket_helper.dart';
import 'package:chat/viewmodel/shuffle/shuffle_view_model_list.dart';
import 'package:chat/views/shuffle/list.dart';
import 'package:chat/views/signin/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ShuffleView extends StatefulWidget {
  @override
  _ShuffleViewState createState() => _ShuffleViewState();
}

class _ShuffleViewState extends BaseState<ShuffleView> {
  var shuffleVM = ShufListState();

  Widget _buildShuffleList(ShuffleListVM vm) {
    return Observer(builder: (context) {
      switch (vm.status) {
        case ListStatus.loading:
          return Center(child: CircularProgressIndicator());
          break;
        case ListStatus.loaded:
          return ShuffleList(shuffleVM: shuffleVM,);
          break;
        case ListStatus.empty:
          return Center(
            child: Text("Data not available"),
          );
          break;
        default:
          return Container();
      }
    });
  }

  @override
  void initState() {
    SocketHelper.shared.connectSocket();
    shuffleVM.fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shuffle Scene'),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                await SharedPreferencesHelper.shared.removeToken();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => SignInView()),
                    (route) => false);
              })
        ],
      ),
      body: _buildShuffleList(shuffleVM),
    );
  }
}
