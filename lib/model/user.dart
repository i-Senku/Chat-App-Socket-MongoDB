class User {
  String id;
  String name;
  String email;
  String sex;
  String about;

  User({this.id, this.name, this.email, this.sex, this.about});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    sex = json['sex'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['sex'] = this.sex;
    data['about'] = this.about;
    return data;
  }
}