import 'package:chat/service/service_manager.dart';
import 'package:chat/viewmodel/shuffle/shuffle_view_model.dart';
import 'package:flutter/cupertino.dart';

enum ListStatus{loading,loaded,empty}

class ShuffleListVM with ChangeNotifier{
  ListStatus status = ListStatus.loading;
  List<ShuffleViewModel> userList = List<ShuffleViewModel>();

  void fetchUser() async{
    var users = await ServiceManager.shared.fetchShuffleList();
    this.userList = users.map((user) => ShuffleViewModel(user: user)).toList();

    if(this.userList.isEmpty){
      status = ListStatus.empty;
    }else{
      print('Yüklendi');
      status = ListStatus.loaded;

    }
    notifyListeners();
  }
}