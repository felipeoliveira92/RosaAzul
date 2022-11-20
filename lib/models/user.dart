// ignore_for_file: non_constant_identifier_names

class User {
  int? id;
  String? name;
  String? username;
  String? password;
  int? type;
  bool? isLogged;

  User({this.id, this.name, this.username, this.password, this.type, this.isLogged});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    password = json['password'];
    type = json['type'];
    isLogged = json['isLogged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['password'] = password;
    data['type'] = type;
    data['isLogged'] = isLogged;
    return data;
  }
}

// ignore: camel_case_types
enum typeUser { user, administrator, client }
