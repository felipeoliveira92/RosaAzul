// ignore_for_file: file_names

class TypeService {
  int? id;
  String? name;
  String? description;
  double? price;

  TypeService({
    this.id,
    this.name,
    this.description,
    this.price,
  });

  TypeService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    return data;
  }
}
