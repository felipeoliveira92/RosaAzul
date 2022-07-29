import 'package:appsalao/models/worktask.dart';
import 'package:flutter/material.dart';

class NewAlterWorkPage extends StatefulWidget {
  WorkTask workTask;

  NewAlterWorkPage({Key? key, required this.workTask}) : super(key: key);

  @override
  State<NewAlterWorkPage> createState() => _NewAlterWorkPageState();
}

class _NewAlterWorkPageState extends State<NewAlterWorkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Horario"),
        ),
        elevation: 20,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text("Data Selecionada: ${widget.workTask.horario}"),
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
                        
                        style: const TextStyle(color: Colors.black, fontSize: 20),
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
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
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
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
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
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Horario",
                            labelStyle: TextStyle(color: Colors.black)),
                      ),

                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.all(24.0),
                        child: ElevatedButton(
                          onPressed: () {
                            
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text('Salvar', style: TextStyle(fontSize: 20)),
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
