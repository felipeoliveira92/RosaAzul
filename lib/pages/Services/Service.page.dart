import 'package:appsalao/pages/Services/ActionsService.page.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Serviços"),
      ),
      body: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  //leading: const Icon(Icons.account_circle),
                  title: Text("clients[index].name.toString()"),
                  subtitle: Text("clients[index].cellphone.toString()"),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () {
                    //Client clientSelected = clients[index];
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ActionsServicePage(action: "Edit")));
                  },
                );
              },
            ),
    );
  }
}
