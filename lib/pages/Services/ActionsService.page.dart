// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:appsalao/controllers/TypeServiceController.dart';
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
  final _typeServiceController = TypeServiceController();

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
                      _typeServiceController.DeleteTypeService(widget.service.id);
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
                  keyboardType: TextInputType.text,
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
                        final saved = _typeServiceController.PostTypeService(widget.service);

                        if (saved != 0) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (context) => const ServicePage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Algo deu errado, não foi possivel salvar!'),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.redAccent,
                          ));
                        }
                      } else if (widget.action == "Edit") {
                        final edited = _typeServiceController.UpdateTypeService(widget.service);

                        if (edited != 0) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (context) => const ServicePage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Algo deu errado, não foi possivel alterar!'),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.redAccent,
                          ));
                        }
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
