class Message {
  String message;
  bool isMy;
  String createdAt;

  Message({this.message, this.isMy,this.createdAt});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isMy = json['ismy'];
    createdAt = json['createdAt'];
  }
}
