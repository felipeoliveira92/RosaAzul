// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appsalao/controllers/ClientController.dart';
import 'package:appsalao/models/client.dart';
import 'package:appsalao/pages/Client/Client.page.dart';
import 'package:flutter/material.dart';

class ActionsClient extends StatefulWidget {
  String action;
  Client client;

  ActionsClient({Key? key, required this.action, required this.client}) : super(key: key);

  @override
  State<ActionsClient> createState() => _ActionsClientState();
}

class _ActionsClientState extends State<ActionsClient> {
  final _clientRepository = ClientController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          if (widget.action != "Create")
            IconButton(
              tooltip: "Deletar ${widget.client.name}",
              icon: const Icon(Icons.delete),
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Realmente deseja deletar?'),
                  backgroundColor: Colors.redAccent,
                  action: SnackBarAction(
                    label: 'Deletar',
                    onPressed: () {
                      var result = _clientRepository.DeleteClient(widget.client.id);

                      if (result != 0) {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => const ClientPage()));
                      }
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: widget.client.name ?? "Nome",
                      labelStyle: const TextStyle(color: Colors.black)),
                  onChanged: (text) {
                    widget.client.name = text;
                  },
                ),
                const SizedBox(
                  width: 20,
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: widget.client.cellphone ?? "Telefone",
                      labelStyle: const TextStyle(color: Colors.black)),
                  onChanged: (text) {
                    widget.client.cellphone = text;
                  },
                ),
                const SizedBox(
                  width: 20,
                  height: 20,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.all(24),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
                    onPressed: () {
                      bool sucess = false;
                      if (widget.action == "Create") {
                        _clientRepository.PostClient(widget.client).then((response) => {
                              if (response != 0)
                                {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(builder: (context) => const ClientPage()))
                                }
                              else
                                {
                                  // ignore: prefer_const_constructors
                                  AlertDialog(
                                    title: const Text('Basic dialog title'),
                                    content: const Text('A dialog'),
                                  )
                                }
                            });
                      } else if (widget.action == "Edit") {
                        _clientRepository.UpdateClient(widget.client).then((response) => {
                              if (response != 0)
                                {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(builder: (context) => const ClientPage()))
                                }
                              else
                                {
                                  // ignore: prefer_const_constructors
                                  AlertDialog(
                                    title: const Text('Basic dialog title'),
                                    content: const Text('A dialog'),
                                  )
                                }
                            });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.save),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: widget.action != "Create"
                                ? const Text('Alterar', style: TextStyle(fontSize: 20))
                                : const Text('Salvar', style: TextStyle(fontSize: 20)))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                  height: 20,
                ),
                if (widget.action != "Create") const Text("Histórico"),
                if (widget.action != "Create")
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        leading: Icon(Icons.account_circle),
                        title: Text("clients[index].name.toString()"),
                        subtitle: Text("clients[index].cellphone.toString()"),
                        trailing: Text("data"),

                        // onTap: () {
                        //   Client clientSelected = clients[index];
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) =>
                        //           ActionsClient(action: "Edit",client: clientSelected)));
                        // },
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
