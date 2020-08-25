import 'package:chat/core/constant.dart';
import 'package:chat/helper/preferences_helper.dart';
import 'package:chat/model/message.dart';
import 'package:chat/model/user.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ServiceManager {
  static final shared = ServiceManager();
  final header = {"Content-Type": "application/json"};

  // Save to locale when user sign up.
  Future<void> _saveUserInfoForLocale() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await SharedPreferencesHelper.shared.getUserToken();
    var body = json.encode({"token": token});
    var response = await http.post(Constant.shared.baseURL + "/user/userinfo",headers: header, body: body);
    var data = jsonDecode(response.body);
    await pref.setString('myID', data['_id']);
  }

  // SignUP
  void signUp(Map<String, dynamic> userData,{void Function(String message) completionHandler}) async {
    var body = json.encode(userData);
    var response = await http.post(Constant.shared.baseURL + "/user/signup",headers: header,body: body);
    var data = jsonDecode(response.body);
    var dataMessage = data['message'];

    if(dataMessage is bool){
      if(dataMessage){
        completionHandler("Kayıt Oluşturuldu Lütfen Giriş Yapınız.");
      }else{
        completionHandler("Kullanıcı kaydı zaten mevcut lütfen");
      }
    }else{
      completionHandler(dataMessage as String);
    }
  }

  // SignIN
  void signIn(Map<String, dynamic> userData,{void Function(bool status, String message) completionHandler}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var body = json.encode(userData);

    try {
      var response = await http.post(Constant.shared.baseURL + "/user/signin",
          headers: header, body: body);
      var jsonBody = jsonDecode(response.body);

      if (jsonBody['message'] is bool) {
        var status = jsonBody['message'];
        if (status) {
          await pref.setString('token', jsonBody['token']); //  Token Kayıt
          await _saveUserInfoForLocale(); // Kullanıcı ID Kayıt işlemi
          completionHandler(true, 'Kullanıcı Giriş yaptı');
        } else {
          completionHandler(false, 'Kullanıcı adı veya şifre yanlış');
        }
      } else {
        completionHandler(false, jsonBody['message']);
      }
    } catch (error) {
      print(error);
    }
  }

  // Fetch Shuffle List
  Future<List<User>> fetchShuffleList() async {
    var token = await SharedPreferencesHelper.shared.getUserToken();
    var body = json.encode({"token" : token});
    var response = await http.post(Constant.shared.baseURL + "/user/shuffle",
        headers: header,body: body);

    if (response.statusCode == 200) {
      var list = (json.decode(response.body) as List)
          .map((element) => User.fromJson(element))
          .toList();
      return list;
    } else {
      return List<User>();
    }
  }

  Future<List<Message>> fetchMessageList(String receiverID) async {
    var myID = await SharedPreferencesHelper.shared.getMyID();
    var body = json.encode({"sender" : myID, "receiver" : receiverID});
    var response = await http.post(Constant.shared.baseURL + "/message/fetchmessage",headers: header,body: body);

    if(response.statusCode == 200){
      var lenght = (json.decode(response.body) as List).length;
      print(lenght);
      var list = (json.decode(response.body) as List).map((e) => Message.fromJson(e)).toList();
      return list;
    }else{
      return List<Message>();
    }
  }

  fetchMessageFromRoom() async {
    var response = await http.get(Constant.shared.baseURL + '');
  }
}
