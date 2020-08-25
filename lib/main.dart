import 'package:chat/helper/preferences_helper.dart';
import 'package:chat/viewmodel/chat/chat_view_model_list.dart';
import 'package:chat/viewmodel/shuffle/shuffle_view_model_list.dart';
import 'package:chat/views/shuffle/shuffle.dart';
import 'package:chat/views/signin/signin.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<ChatListState>(ChatListState(), signalsReady: true);

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesHelper.shared.userControl(completionHandler: (status) {
    if (status) {
      runApp(MaterialApp(
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => ShuffleListVM()),
            ],
            child: ShuffleView(),
          ),
          debugShowCheckedModeBanner: false));
    } else {
      runApp(MaterialApp(
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => ShuffleListVM()),
            ],
            child: SignInView(),
          ),
          debugShowCheckedModeBanner: false));
    }
  });
}
