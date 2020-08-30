import 'package:chat/core/get_it.dart';
import 'package:chat/helper/preferences_helper.dart';
import 'package:chat/views/shuffle/shuffle.dart';
import 'package:chat/views/signin/signin.dart';
import 'package:flutter/material.dart';


void main() {
  XuGetIt.setup();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesHelper.shared.userControl(completionHandler: (status) {
    runApp(MaterialApp(home:status ? ShuffleView() : SignInView(),debugShowCheckedModeBanner: false));
  });
}
