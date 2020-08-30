import 'package:chat/viewmodel/chat/chat_view_model_list.dart';
import 'package:chat/viewmodel/shuffle/shuffle_view_model_list.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class XuGetIt{
  static void setup(){
    getIt.registerSingleton<ChatListState>(ChatListState(), signalsReady: true);
    getIt.registerSingleton<ShufListState>(ShufListState(), signalsReady: true);
  }
}