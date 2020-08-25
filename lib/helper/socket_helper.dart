import 'package:chat/helper/preferences_helper.dart';
import 'package:chat/helper/stream_controller_helper.dart';
import 'package:chat/main.dart';
import 'package:chat/viewmodel/chat/chat_view_model_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketHelper {

  static final shared = SocketHelper();
  ChatListState vm = ChatListState();
  IO.Socket socket;
  var id;

  void connectSocket() async{
    id = await SharedPreferencesHelper.shared.getMyID();
    socket = IO.io('https://morning-journey-38234.herokuapp.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.on('connect', (data) {
      socket.emit('chatID',{'id' : id});
      socket.on('receive_message', (data) {
        var content = data['content'].toString();
        var isImage = data['isImage'] as bool;
        getIt<ChatListState>().addMessage(message: content,isMy: false,isImage: isImage);
        StreamControllerHelper.shared.setLastIndex(getIt<ChatListState>().messageList.length);
      } );
    });
    
  }

  void sendMessage({@required String receiver,@required String message,bool isImage}){
    getIt<ChatListState>().addMessage(message: message,isMy: true,isImage: isImage);
    StreamControllerHelper.shared.setLastIndex(getIt<ChatListState>().messageList.length);

    socket.emit('send_message',{
      "senderChatID" : id,
      "receiverChatID" : receiver,
      "content" : message,
      "isImage" : isImage
    });
    
  }

}
