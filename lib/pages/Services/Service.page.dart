import 'package:appsalao/controllers/TypeServiceController.dart';
import 'package:appsalao/models/typeServices.dart';
import 'package:appsalao/pages/Services/ActionsService.page.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final _typeServiceController = TypeServiceController();
  List<TypeService> listServices = [];
  TypeService serviceSelected = TypeService();

  @override
  Widget build(BuildContext context) {
    _typeServiceController.GetAll().then((value) => {
          setState(
            () {
              listServices = value;
            },
          )
        });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Serviços"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: listServices.length,
        itemBuilder: (context, index) {
          return ListTile(
            //leading: const Icon(Icons.account_circle),
            title: Text("${listServices[index].name}"),
            subtitle: Text("${listServices[index].description}"),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              serviceSelected = listServices[index];
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ActionsServicePage(action: "Edit", service: serviceSelected)));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ActionsServicePage(action: "Create", service: TypeService()))),
      ),
    );
  }
}
