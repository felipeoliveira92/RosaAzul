// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:appsalao/repositories/typeservices.repository.dart';
import 'package:flutter/material.dart';

import 'package:appsalao/models/typeServices.dart';
import 'package:appsalao/pages/Services/Service.page.dart';

class ActionsServicePage extends StatefulWidget {
  String action;
  TypeService service;

  ActionsServicePage({
    Key? key,
    required this.action,
    required this.service,
  }) : super(key: key);

  @override
  State<ActionsServicePage> createState() => _ActionsServicePageState();
}

class _ActionsServicePageState extends State<ActionsServicePage> {
  final _serviceRepository = TypeServiceRepository();

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
              tooltip: "Deletar ${widget.service.description ?? ""}",
              icon: const Icon(Icons.delete),
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Realmente deseja deletar?'),
                  backgroundColor: Colors.redAccent,
                  action: SnackBarAction(
                    label: 'Deletar',
                    onPressed: () {
                      _serviceRepository.DeleteTypeService(widget.service.id);
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
                  initialValue: widget.service.name ?? "",
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Nome", labelStyle: TextStyle(color: Colors.black)),
                  onChanged: (text) {
                    widget.service.name = text;
                  },
                ),
                const SizedBox(
                  width: 20,
                  height: 20,
                ),
                TextFormField(
                  initialValue: widget.service.description ?? "",
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Descrição", labelStyle: TextStyle(color: Colors.black)),
                  onChanged: (text) {
                    widget.service.description = text;
                  },
                ),
                const SizedBox(
                  width: 20,
                  height: 20,
                ),
                TextFormField(
                  initialValue: widget.service.price == null ? "" : widget.service.price.toString(),
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Preço", labelStyle: TextStyle(color: Colors.black)),
                  onChanged: (text) {
                    widget.service.price = double.parse(text);
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
                      if (widget.action == "Create") {
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
                      } else if (widget.action == "Edit") {
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
                                ? const Text('Alterar', style: TextStyle(fontSize: 20))
                                : const Text('Salvar', style: TextStyle(fontSize: 20)))
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
