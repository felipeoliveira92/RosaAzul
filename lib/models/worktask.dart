
class WorkTask {
  int? id;
  DateTime? dateInitial;
  DateTime? dateEnd;
  int? idClient;
  int? idService;
  int? idUser;
  double? price;
  String? observation;

  WorkTask(
      {this.id,
      this.dateInitial,
      this.dateEnd,
      this.idClient,
      this.idService,
      this.idUser,
      this.price,
      this.observation});

  WorkTask.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateInitial = DateTime.parse(json['dateInitial']);
    dateEnd = json['dateEnd'] != "null" ? DateTime.parse(json['dateEnd']) : null;
    idClient = json['idClient'];
    idService = json['idService'];
    idUser = json['idUser'];
    price = json['price'];
    observation = json['observation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dateInitial'] = dateInitial.toString();
    data['dateEnd'] = dateEnd.toString();
    data['idClient'] = idClient;
    data['idService'] = idService;
    data['idUser'] = idUser;
    data['price'] = price;
    data['observation'] = observation;
    return data;
  }
}
