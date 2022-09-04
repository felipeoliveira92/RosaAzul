import 'package:appsalao/controllers/api.dart';
import 'package:appsalao/models/worktask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../repositories/worktask.repository.dart';
import 'calendarpage.dart';

class AddWorkPage extends StatefulWidget {
  String dateSelected;

  AddWorkPage({Key? key, required this.dateSelected}) : super(key: key);

  @override
  State<AddWorkPage> createState() => _AddWorkPageState();
}

class _AddWorkPageState extends State<AddWorkPage> {
  WorkTask workTask = new WorkTask();
  final _workTaskRepository = WorkTaskRepository();

  @override
  Widget build(BuildContext context) {
    workTask.id = "22";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionando Novo Horario"),
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
                        onChanged: (text) {
                          workTask.nomeCliente = text;
                        },
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
                        onChanged: (text) {
                          workTask.descricao = text;
                        },
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
                        onChanged: (text) {
                          workTask.preco = text;
                        },
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
                        onChanged: (text) {
                          workTask.horario = int.parse(text);
                        },
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.all(24.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // var sucess = API.postNewWorkTask(workTask);
                            bool sucess = false;
                            _workTaskRepository.PostWorkTask(workTask)
                                .then((response) => {
                                  if(response.statusCode == 201)
                                  {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const calendarpage())
                                    )                                  
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
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
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
