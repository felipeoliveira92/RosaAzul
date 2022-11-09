import 'package:appsalao/controllers/ClientController.dart';
import 'package:appsalao/models/client.dart';
import 'package:appsalao/pages/Client/ActionsClient.page.dart';
import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  List<Client> clients = [];
  final _clientRepository = ClientController();
  var aux;
  List<Client> resultFilterClient = [];

  _ClientPageState() {
    _clientRepository.GetAll().then((result) {
      setState(() {
        clients = result;
        resultFilterClient = clients;
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
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: "Busca",
                    labelStyle: const TextStyle(color: Colors.black)),
                onChanged: (text) {
                  //faço o filtro pelo campo nome cliente
                  if (text != "") {
                    aux = clients
                        .where((element) => element.name!.contains(text)).toList();
                    if (aux.isNotEmpty) {
                      setState(() {
                        resultFilterClient = [];
                        resultFilterClient = aux;
                      });
                    }
                    else{
                      setState(() {
                        resultFilterClient = [];
                      });
                    }
                  } else {
                    setState(() {
                      resultFilterClient = clients;
                    });
                  }
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
              itemCount: resultFilterClient.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: Text(resultFilterClient[index].name.toString()),
                  subtitle: Text(resultFilterClient[index].cellphone.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.call),
                        tooltip: "Ligar para ${resultFilterClient[index].name}",
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.whatsapp),
                        tooltip:
                            "Mandar um whatsapp para ${resultFilterClient[index].name}",
                        onPressed: () {},
                      ),
                      const Icon(Icons.navigate_next)
                    ],
                  ),
                  onTap: () {
                    Client clientSelected = resultFilterClient[index];
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
