import 'package:appsalao/models/worktask.dart';
import 'package:flutter/material.dart';
import '../../repositories/worktask.repository.dart';
import 'calendarpage.dart';

class AddWorkPage extends StatefulWidget {
  String dateSelected;

  AddWorkPage({Key? key, required this.dateSelected}) : super(key: key);

  @override
  State<AddWorkPage> createState() => _AddWorkPageState();
}

class _AddWorkPageState extends State<AddWorkPage> {
  WorkTask workTask = WorkTask();
  final _workTaskRepository = WorkTaskRepository();
  var timeSelected = TimeOfDay.now();

_AddWorkPageState(){
  //workTask.id = DateTime.now().day.toString();
}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionando Novo Serviço"),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: timeSelected == TimeOfDay.now()
                                ? const Text("Selecione um horario:",
                                    style: TextStyle(fontSize: 16))
                                : Text(
                                    "Horario selecionado: ${timeSelected.hour}:${timeSelected.minute}",
                                    style: TextStyle(fontSize: 20)),
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
                                  workTask.horario = timeSelected.hour;
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
                            // var sucess = API.postNewWorkTask(workTask);
                            bool sucess = false;
                            _workTaskRepository.PostWorkTask(workTask)
                                .then((response) => {
                                      if (response.statusCode == 201)
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
                            children: const [
                              Icon(Icons.save),
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
