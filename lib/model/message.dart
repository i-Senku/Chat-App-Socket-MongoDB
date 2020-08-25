class Message {
  String message;
  bool isMy;
  bool isImage;
  String createdAt;

  Message({this.message, this.isMy,this.createdAt,this.isImage = false});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? "";
    isMy = json['ismy'];
    createdAt = json['createdAt'];
    isImage = json['isImage'] ?? false;
  }
}
