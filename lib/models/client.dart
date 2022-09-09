class Client {
  String? name;
  String? cellphone;
  String? id;

  Client({this.name, this.cellphone, this.id});

  Client.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cellphone = json['cellphone'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cellphone'] = this.cellphone;
    data['id'] = this.id;
    return data;
  }
}