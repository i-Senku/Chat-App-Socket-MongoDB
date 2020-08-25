import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferences _pref;
  static var shared = SharedPreferencesHelper();

  // User Control
  void userControl({void Function(bool) completionHandler}) async {
    _pref = await SharedPreferences.getInstance();
    var token = _pref.getString('token');
    if (token != null) {
      completionHandler(true);
    } else {
      completionHandler(false);
    }
  }

  // Return Token
  Future<String> getUserToken()async{
    _pref = await SharedPreferences.getInstance();
    var token = _pref.getString('token');
    return token;
  }

  // Return MyID
  Future<String> getMyID()async{
    _pref = await SharedPreferences.getInstance();
    var id = _pref.getString('myID');
    return id;
  }

  //Remove Token and ID
  Future<void> removeToken() async{
    _pref = await SharedPreferences.getInstance();
    _pref.remove('token');
    _pref.remove('myID');
  }


}
