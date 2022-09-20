import 'package:appsalao/models/client.dart';

class WorkTask {
  int? id;
  DateTime? dateInitial;
  String? dateEnd;
  int? idClient;
  Client? client;
  int? idService;
  int? idUser;
  int? price;
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
    dateInitial = json['dateInitial'];
    dateEnd = json['dateEnd'];
    idClient = json['idClient'];
    idService = json['idService'];
    idUser = json['idUser'];
    price = json['price'];
    observation = json['observation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dateInitial'] = dateInitial;
    data['dateEnd'] = dateEnd;
    data['idClient'] = idClient;
    data['idService'] = idService;
    data['idUser'] = idUser;
    data['price'] = price;
    data['observation'] = observation;
    return data;
  }
}
