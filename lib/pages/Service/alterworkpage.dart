import 'package:appsalao/models/worktask.dart';
import 'package:appsalao/pages/Service/calendarpage.dart';
import 'package:appsalao/repositories/worktask.repository.dart';
import 'package:flutter/material.dart';

class AlterWorkPage extends StatefulWidget {
  WorkTask workTask;

  AlterWorkPage({Key? key, required this.workTask}) : super(key: key);

  @override
  State<AlterWorkPage> createState() => _AlterWorkPageState();
}

class _AlterWorkPageState extends State<AlterWorkPage> {
  final _workTaskRepository = WorkTaskRepository();
  var timeSelected = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alterando Serviço"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
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
                            labelStyle: TextStyle(color: Colors.black)
                        ),
                        onChanged: (text) {
                          widget.workTask.nomeCliente = text;
                        },
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
                            labelStyle: TextStyle(color: Colors.black)
                        ),
                        onChanged: (text) {
                          widget.workTask.descricao = text;
                        },
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
                            labelStyle: TextStyle(color: Colors.black)
                        ),
                        onChanged: (text) {
                          widget.workTask..preco = text;
                        },
                      ),
                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: widget.workTask.horario == null 
                                ? const Text("Selecione um horario: ", style: TextStyle(fontSize: 20))
                                : Text("Horario selecionado: ${widget.workTask.horario}", style: const TextStyle(fontSize: 20))
                          ),
                          IconButton(
                            alignment: Alignment.centerRight,
                            icon: const Icon(Icons.access_time),
                            onPressed: () async {
                              final time = await showTimePicker(
                                context: context,
                                builder: (context, child) => MediaQuery(
                                    data: MediaQuery.of(context)
                                        .copyWith(alwaysUse24HourFormat: true),
                                    child: child ?? Container()),
                                initialTime: TimeOfDay(
                                    hour: DateTime.now().hour,
                                    minute: DateTime.now().minute),
                              );

                              if (time != null) {
                                setState(() {
                                  timeSelected = TimeOfDay(
                                      hour: time.hour,
                                      minute: time.minute);
                                  widget.workTask.horario = timeSelected.hour;
                                });
                              }
                            },
                          ),
                        ],
                      ),

                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.all(24.0),
                        child: ElevatedButton(
                          onPressed: () {
                            bool sucess = false;
                            _workTaskRepository.UpdateWorkTask(widget.workTask)
                                .then((response) => {
                                      if (response.statusCode == 200)
                                        {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const calendarpage()))
                                        }
                                      else
                                        {
                                          // ignore: prefer_const_constructors
                                          AlertDialog(
                                            title: const Text(
                                                'Basic dialog title'),
                                            content: const Text('A dialog'),
                                          )
                                        }
                                    });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              Icon(Icons.edit),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text('Alterar', style: TextStyle(fontSize: 20)),
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
