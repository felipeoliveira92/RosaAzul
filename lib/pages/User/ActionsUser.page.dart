// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:appsalao/models/user.dart';
import 'package:appsalao/repositories/user.repository.dart';

class ActionsUserPage extends StatefulWidget {
  User user;
  String action;

  ActionsUserPage({
    Key? key,
    required this.user,
    required this.action,
  }) : super(key: key);

  @override
  State<ActionsUserPage> createState() => _ActionsUserPageState();
}

class _ActionsUserPageState extends State<ActionsUserPage> {
  final userRepository = UserRepository();

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
              tooltip: "Deletar ${widget.user.name ?? ""}",
              icon: const Icon(Icons.delete),
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Realmente deseja deletar?'),
                  backgroundColor: Colors.redAccent,
                  action: SnackBarAction(
                    label: 'Deletar',
                    onPressed: () {
                      userRepository.DeleteUser(widget.user.id);
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
                  initialValue: widget.user.name ?? "",
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Nome", labelStyle: TextStyle(color: Colors.black)),
                  onChanged: (text) {
                    widget.user.name = text;
                  },
                ),
                const SizedBox(
                  width: 20,
                  height: 20,
                ),
                TextFormField(
                  initialValue: widget.user.username ?? "",
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Username", labelStyle: TextStyle(color: Colors.black)),
                  onChanged: (text) {
                    widget.user.username = text;
                  },
                ),
                const SizedBox(
                  width: 20,
                  height: 20,
                ),
                TextFormField(
                  initialValue: widget.user.password ?? "",
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Senha", labelStyle: TextStyle(color: Colors.black)),
                  onChanged: (text) {
                    widget.user.password = text;
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
                    onPressed: () {},
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
