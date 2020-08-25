import 'package:chat/core/base_state.dart';
import 'package:chat/helper/preferences_helper.dart';
import 'package:chat/helper/socket_helper.dart';
import 'package:chat/viewmodel/shuffle/shuffle_view_model_list.dart';
import 'package:chat/views/shuffle/list.dart';
import 'package:chat/views/signin/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShuffleView extends StatefulWidget {
  @override
  _ShuffleViewState createState() => _ShuffleViewState();
}

class _ShuffleViewState extends BaseState<ShuffleView> {
  var shuffleVM = ShuffleListVM();
  

  Widget _buildShuffleList(ShuffleListVM vm){
    switch(vm.status){
      case ListStatus.loading:
      return Center(child: CircularProgressIndicator());
      break;
      case ListStatus.loaded:
        return ShuffleList();
      break;
      case ListStatus.empty:
        return Center(child: Text("Data not available"),);
      break;
      default:
      return Container();
    }

  }

  @override
  void initState() {
    SocketHelper.shared.connectSocket();
    Provider.of<ShuffleListVM>(context,listen: false).fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<ShuffleListVM>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Shuffle Scene'),actions: [
        IconButton(icon: Icon(Icons.exit_to_app), onPressed: () async {
           await SharedPreferencesHelper.shared.removeToken();
           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignInView()), (route) => false);
        })
      ],),
      body: _buildShuffleList(vm),
    );
  }
  
}