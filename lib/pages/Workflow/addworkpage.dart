// ignore_for_file: unrelated_type_equality_checks

import 'package:appsalao/controllers/ClientController.dart';
import 'package:appsalao/controllers/TypeServiceController.dart';
import 'package:appsalao/controllers/WorkTaskController.dart';
import 'package:appsalao/models/client.dart';
import 'package:appsalao/models/typeServices.dart';
import 'package:appsalao/models/worktask.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'calendarpage.dart';

class AddWorkPage extends StatefulWidget {
  String dateSelected;

  AddWorkPage({Key? key, required this.dateSelected}) : super(key: key);

  @override
  State<AddWorkPage> createState() => _AddWorkPageState();
}

class _AddWorkPageState extends State<AddWorkPage> {
  WorkTask workTask = WorkTask();
  final _workTaskRepository = WorkTaskController();
  final _clientsRepository = ClientController();
  final _serviceRepository = TypeServiceController();

  //List<Client> clients = [];
  List<Client> autoCompleteclients = [];
  List<TypeService> autoCompleteServices = [];
  var timeSelected = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    _clientsRepository.GetAll().then(
      (value) {
        setState(() {
          autoCompleteclients = value;
          var dateTime = DateTime.now();
          workTask.dateInitial =
              DateTime(dateTime.year, dateTime.month, dateTime.day, timeSelected.hour, timeSelected.minute);
        });
      },
    );
    _serviceRepository.GetAll().then((value) {
      setState(() {
        autoCompleteServices = value;
      });
    });

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
                      SearchField(
                        hint: "Search",
                        searchInputDecoration: InputDecoration(
                          labelText: "Cliente",
                          labelStyle: const TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        suggestions: autoCompleteclients
                            .map((e) => SearchFieldListItem(e.name.toString(), child: Text(e.name.toString())))
                            .toList(),
                        onSuggestionTap: (text) {
                          // _clientsRepository.GetClientByName(text.searchKey).then((result) => {
                          //       setState(() {
                          //         workTask.client = result;
                          //       })
                          //     });
                          workTask.idClient =
                              autoCompleteclients.firstWhere((element) => element.name == text.searchKey).id;
                        },
                      ),
                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      SearchField(
                        hint: "Search",
                        searchInputDecoration: InputDecoration(
                          labelText: "Trabalho",
                          labelStyle: const TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        suggestions: autoCompleteServices
                            .map((e) => SearchFieldListItem(e.name.toString(), child: Text(e.name.toString())))
                            .toList(),
                        onSuggestionTap: (text) {
                          // _serviceRepository.GetTypeServiceByName(text.searchKey).then((result) => {
                          //       setState(() {
                          //         workTask.typeService = result;
                          //       })
                          //     });
                          workTask.idService =
                              autoCompleteServices.firstWhere((element) => element.name == text.searchKey).id;
                        },
                      ),
                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            labelText: "Preço",
                            labelStyle: const TextStyle(color: Colors.black)),
                        onChanged: (text) {
                          workTask.price = double.parse(text);
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
                                ? const Text("Selecione um horario:", style: TextStyle(fontSize: 16))
                                : Text("Horario selecionado: ${timeSelected.hour}:${timeSelected.minute}",
                                    style: const TextStyle(fontSize: 20)),
                          ),
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
                                  var dateTime = DateTime.now();
                                  workTask.dateInitial = DateTime(dateTime.year, dateTime.month, dateTime.day,
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
                            _workTaskRepository.PostWorkTask(workTask).then((result) => {
                                  if (result != 0)
                                    {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context) => const calendarpage()))
                                    }
                                  else
                                    {ScaffoldMessenger.of(context).showSnackBar(snackBar)}
                                });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.save),
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

// ignore: prefer_const_constructors
final snackBar = SnackBar(
  content: const Text('Yay! A SnackBar!'),
  backgroundColor: Colors.redAccent,
);
