import 'dart:developer';

import 'package:appsalao/pages/Services/Service.page.dart';
import 'package:flutter/material.dart';

class ActionsServicePage extends StatefulWidget {
  String action;

  ActionsServicePage({
    Key? key,
    required this.action,
  }) : super(key: key);

  @override
  State<ActionsServicePage> createState() => _ActionsServicePageState();
}

class _ActionsServicePageState extends State<ActionsServicePage> {
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
              tooltip: "Deletar fulano",
              icon: const Icon(Icons.delete),
              onPressed: () {},
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
                      // labelText: widget.client.name ?? "Nome",
                      labelStyle: const TextStyle(color: Colors.black)),
                  onChanged: (text) {
                    //workTask.descricao = text;
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
                      // labelText: widget.client.cellphone ?? "Telefone",
                      labelStyle: const TextStyle(color: Colors.black)),
                  onChanged: (text) {
                    //workTask.preco = text;
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
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        )
                      )
                    ),
                    onPressed: () {
                      if (widget.action == "Create") 
                      {
                        // _clientRepository.PostClient(widget.client).then((response) => {
                        //     if (response.statusCode == 201)
                        //     {
                        //       Navigator.of(context).push(
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   const ServicePage()))
                        //     }
                        //     else
                        //     {
                        //       // ignore: prefer_const_constructors
                        //       AlertDialog(
                        //         title: const Text(
                        //             'Basic dialog title'),
                        //         content: const Text('A dialog'),
                        //       )
                        //     }  
                        // });
                      }
                      else if (widget.action == "Edit")
                      {
                        // _clientRepository.UpdateClient(widget.client).then((response) => {
                        //     if (response.statusCode == 200)
                        //     {
                        //       Navigator.of(context).push(
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   const ServicePage()))
                        //     }
                        //     else
                        //     {
                        //       // ignore: prefer_const_constructors
                        //       AlertDialog(
                        //         title: const Text(
                        //             'Basic dialog title'),
                        //         content: const Text('A dialog'),
                        //       )
                        //     }  
                        // });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.save),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: widget.action != "Create"
                                ? const Text('Alterar',
                                    style: TextStyle(fontSize: 20))
                                : const Text('Salvar',
                                    style: TextStyle(fontSize: 20)))
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
