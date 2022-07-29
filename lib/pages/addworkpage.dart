import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddWorkPage extends StatefulWidget {
  String dateSelected;

  AddWorkPage({
    Key? key, required this.dateSelected
  }) : super(key: key);

  @override
  State<AddWorkPage> createState() => _AddWorkPageState();
}

class _AddWorkPageState extends State<AddWorkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Adicionando Novo Horario"),
        ),
        elevation: 20,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text("Data Selecionada: ${widget.dateSelected}"),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Cliente",
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Trabalho",
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Preço",
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Horario",
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.all(24.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text('Salvar',
                                    style: TextStyle(fontSize: 20)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
