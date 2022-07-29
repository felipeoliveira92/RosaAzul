import 'package:appsalao/models/worktask.dart';
import 'package:flutter/material.dart';

class AlterWorkPage extends StatefulWidget {
  WorkTask workTask;

  AlterWorkPage({Key? key, required this.workTask}) : super(key: key);

  @override
  State<AlterWorkPage> createState() => _AlterWorkPageState();
}

class _AlterWorkPageState extends State<AlterWorkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Alterando Horario"),
        ),
        elevation: 20,        
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
                        initialValue: widget.workTask.nomeCliente == null ? "" : widget.workTask.nomeCliente,
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
                        initialValue: widget.workTask.descricao == null ? "" : widget.workTask.descricao,
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
                        initialValue: widget.workTask.preco == null ? "" : widget.workTask.preco,
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
                        initialValue: widget.workTask.horario == null ? "" : widget.workTask.horario.toString(),
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
