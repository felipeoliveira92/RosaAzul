import 'package:appsalao/controllers/WorkTaskController.dart';
import 'package:appsalao/models/worktask.dart';
import 'package:appsalao/pages/viewModels/worktaskViewModel.dart';
import 'package:appsalao/repositories/Api/worktask.repository.dart';
import 'package:flutter/material.dart';

import 'calendarpage.dart';

class AlterWorkPage extends StatefulWidget {
  WorkTaskViewModel workTask;

  AlterWorkPage({Key? key, required this.workTask}) : super(key: key);

  @override
  State<AlterWorkPage> createState() => _AlterWorkPageState();
}

class _AlterWorkPageState extends State<AlterWorkPage> {
  final _workTaskRepository = WorkTaskController();
  var timeSelected = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alterando Serviço"),
        actions: [
          IconButton(
            tooltip: "Deletar ${widget.workTask.client?.name ?? ''}",
            icon: const Icon(Icons.delete),
            onPressed: () {
              final snackBar = SnackBar(
                content: const Text('Realmente deseja deletar?'),
                backgroundColor: Colors.redAccent,
                action: SnackBarAction(
                  label: 'Deletar',
                  onPressed: () {
                    var result = _workTaskRepository.DeleteWorkTask(widget.workTask.id ?? 0);

                    if (result != 0) {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => const calendarpage()));
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
                        initialValue: widget.workTask.client?.name == null ? "" : widget.workTask.client!.name,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Cliente",
                            labelStyle: TextStyle(color: Colors.black)),
                        onChanged: (text) {
                          widget.workTask.client!.name = text;
                        },
                      ),
                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: widget.workTask.typeService?.name ?? "",
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Trabalho",
                            labelStyle: TextStyle(color: Colors.black)),
                        onChanged: (text) {
                          widget.workTask.observation = text;
                        },
                      ),
                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: widget.workTask.price == null ? "" : widget.workTask.price.toString(),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Preço",
                            labelStyle: TextStyle(color: Colors.black)),
                        onChanged: (text) {
                          widget.workTask.price = text as double;
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
                              child: widget.workTask.dateInitial == null
                                  ? const Text("Selecione um horario: ", style: TextStyle(fontSize: 20))
                                  : Text(
                                      "Horario selecionado: ${widget.workTask.dateInitial?.hour}:${widget.workTask.dateInitial?.minute}",
                                      style: const TextStyle(fontSize: 20))),
                          IconButton(
                            alignment: Alignment.centerRight,
                            icon: const Icon(Icons.access_time),
                            onPressed: () async {
                              final time = await showTimePicker(
                                context: context,
                                builder: (context, child) => MediaQuery(
                                    data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                    child: child ?? Container()),
                                initialTime: TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
                              );

                              if (time != null) {
                                setState(() {
                                  timeSelected = TimeOfDay(hour: time.hour, minute: time.minute);
                                  var dateTime = DateTime.parse(widget.workTask.dateInitial.toString());
                                  widget.workTask.dateInitial = DateTime(dateTime.year, dateTime.month, dateTime.day,
                                      timeSelected.hour, timeSelected.minute);
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
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
                          onPressed: () {
                            _workTaskRepository.UpdateWorkTask(WorkTask.fromJson(widget.workTask.toJson()))
                                .then((result) => {
                                      if (result != 0)
                                        {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(builder: (context) => const calendarpage()))
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
