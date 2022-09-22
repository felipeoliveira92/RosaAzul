import 'package:appsalao/models/client.dart';
import 'package:appsalao/models/typeServices.dart';
import 'package:appsalao/models/user.dart';

class WorkTask {
  int? id;
  DateTime? dateInitial;
  DateTime? dateEnd;
  int? idClient;
  Client? client;
  int? idService;
  TypeService? typeService;
  int? idUser;
  User? user;
  double? price;
  String? observation;

  WorkTask(
      {this.id,
      this.dateInitial,
      this.dateEnd,
      this.idClient,
      this.client,
      this.idService,
      this.typeService,
      this.idUser,
      this.user,
      this.price,
      this.observation});

  WorkTask.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateInitial = DateTime.parse(json['dateInitial']);
    dateEnd = DateTime.parse(json['dateEnd']);
    idClient = json['idClient'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    idService = json['idService'];
    typeService = json['service'] != null ? TypeService.fromJson(json['service']) : null;
    idUser = json['idUser'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    price = json['price'];
    observation = json['observation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //data['id'] = id;
    data['dateInitial'] = dateInitial.toString();
    data['dateEnd'] = dateEnd.toString();
    data['idClient'] = idClient;
    //data['client'] = client!.toJson();
    data['idService'] = idService;
    //data['service'] = typeService!.toJson();
    data['idUser'] = idUser;
    //data['user'] = user!.toJson();
    data['price'] = price;
    data['observation'] = observation;
    return data;
  }
}
