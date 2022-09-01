class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? password;

  User({this.id, this.name, this.username, this.email, this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
