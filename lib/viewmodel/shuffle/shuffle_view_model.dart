import 'package:chat/model/user.dart';

class ShuffleViewModel{
  User _user;
  ShuffleViewModel({User user}) : this._user = user;
  
  String get id => _user.id;
  String get name => _user.name;
  String get email => _user.email;
  String get sex => _user.sex;
  String get about => _user.about;
  
}