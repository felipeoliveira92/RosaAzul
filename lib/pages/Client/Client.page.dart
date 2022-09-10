import 'package:appsalao/models/client.dart';
import 'package:appsalao/pages/Client/ActionsClient.page.dart';
import 'package:appsalao/repositories/client.repository.dart';
import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  List<Client> clients = [];
  final _clientRepository = ClientRepository();
  var aux;

  _ClientPageState() {
    _clientRepository.GetAll().then((result) {
      setState(() {
        clients = result;
        aux = clients;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clientes"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Busca",
                    labelStyle: TextStyle(color: Colors.black)),
                onChanged: (text) {
                  //faço o filtro pelo campo nome cliente
                  if (text != "") {
                    var client = clients.first;
                    if (client.id != null) {
                      setState(() {
                        aux = clients;
                        clients = [];
                        clients.add(client);
                      });
                    }
                  } else {
                    setState(() {
                      clients = aux;
                    });
                  }

                  // _clientRepository.GetClientByName(text).then((result) {
                  //   setState(() {
                  //     clients = [];
                  //     clients.add(result);
                  //   });
                  // });
                },
              ),
            ),
            const SizedBox(
              width: 20,
              height: 20,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: clients.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: Text(clients[index].name.toString()),
                  subtitle: Text(clients[index].cellphone.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.call),
                        tooltip: "Ligar para ${clients[index].name}",
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.whatsapp),
                        tooltip:
                            "Mandar um whatsapp para ${clients[index].name}",
                        onPressed: () {},
                      ),
                      const Icon(Icons.navigate_next)
                    ],
                  ),
                  onTap: () {
                    Client clientSelected = clients[index];
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ActionsClient(
                            action: "Edit", client: clientSelected)));
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        tooltip: "Adicionar novo Cliente",
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>
                  ActionsClient(action: "Create", client: Client())),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
