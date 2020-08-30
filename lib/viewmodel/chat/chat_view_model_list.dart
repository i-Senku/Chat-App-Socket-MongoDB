import 'package:chat/model/message.dart';
import 'package:chat/service/service_manager.dart';
import 'package:chat/viewmodel/chat/chat_view_model.dart';
import 'package:mobx/mobx.dart';

part 'chat_view_model_list.g.dart';

class ChatListState = ChatListVM with _$ChatListState;

enum MessageStatus { loading, loaded, empty }

abstract class ChatListVM with Store {
  @observable
  MessageStatus messageStatus = MessageStatus.empty;

  @observable
  ObservableList<ChatViewModel> messageList = ObservableList<ChatViewModel>();

  @observable
  ObservableList<String> writingUsers = ObservableList<String>();

  @action
  Future<void> fetchMessage(String receiverID) async {
    messageStatus = MessageStatus.loading; // Veriler Getiriliyor
    var list = await ServiceManager.shared.fetchMessageList(receiverID);
    this.messageList =
        ObservableList.of((list.map((e) => ChatViewModel(message: e))));

    if (messageList.isNotEmpty) {
      // Veri Var ise
      messageStatus = MessageStatus.loaded;
    } else {
      messageStatus = MessageStatus.empty;
    }
  }

  @action
  addMessage({String message, bool isMy, bool isImage}) {
    messageList.add(ChatViewModel(
        message: Message(
            message: message,
            isMy: isMy,
            createdAt: DateTime.now().toString(),
            isImage: isImage)));
    messageStatus = MessageStatus.loaded;
  }

  @action
  setWritingUsers(List<String> writing) {
    writingUsers = ObservableList.of(writing);
  }
}
