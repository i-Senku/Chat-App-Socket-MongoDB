import 'package:chat/service/service_manager.dart';
import 'package:chat/viewmodel/shuffle/shuffle_view_model.dart';
import 'package:mobx/mobx.dart';

part 'shuffle_view_model_list.g.dart';

class ShufListState  = ShuffleListVM with _$ShufListState;

enum ListStatus{loading,loaded,empty}
enum UserStatus{online,offline}

abstract class ShuffleListVM with Store{
  
  @observable
  ListStatus status = ListStatus.loading;

  @observable
  List<ShuffleViewModel> userList = List<ShuffleViewModel>();

  @observable
  ObservableList<String> onlineUsers = ObservableList<String>();

  @action
  Future<void> fetchUser() async{
    var users = await ServiceManager.shared.fetchShuffleList();
    this.userList = users.map((user) => ShuffleViewModel(user: user)).toList();

    if(this.userList.isEmpty){
      status = ListStatus.empty;
    }else{
      status = ListStatus.loaded;
    }
  }

  @action setOnlineUsers(List<String> users){
    onlineUsers = ObservableList.of(users);
  }
}