class Client {
  String? name;
  String? cellphone;
  int? id;

  Client({this.name, this.cellphone, this.id});

  Client.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cellphone = json['cellphone'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['cellphone'] = cellphone;
    data['id'] = id;
    return data;
  }
}