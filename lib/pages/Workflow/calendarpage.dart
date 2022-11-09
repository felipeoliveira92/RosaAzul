// ignore_for_file: camel_case_types

import 'package:appsalao/controllers/ClientController.dart';
import 'package:appsalao/controllers/TypeServiceController.dart';
import 'package:appsalao/controllers/WorkTaskController.dart';
import 'package:appsalao/models/user.dart';
import 'package:appsalao/models/worktask.dart';
import 'package:appsalao/pages/Workflow/addworkpage.dart';
import 'package:flutter/material.dart';
import '../../repositories/Api/worktask.repository.dart';
import 'alterworkpage.dart';

class calendarpage extends StatefulWidget {
  const calendarpage({Key? key}) : super(key: key);
  _calendarpageState createState() => _calendarpageState();
}

class _calendarpageState extends State<calendarpage> {
  List<User> users = [];
  User user = User();

  var dateSelected = DateTime.now().toString().split(' ')[0];
  final _workTaskRepository = WorkTaskController();
  final _clientRepository = ClientController();
  final _serviceRepository = TypeServiceController();
  List<WorkTask> workTasks = [];

  // ignore: non_constant_identifier_names
  void InicializeFields() {
    _workTaskRepository.GetAllByDate(DateTime.now().toUtc()).then((list) {
      setState(() {
        workTasks = list;
        workTasks.forEach((element) {
          _clientRepository.GetClientById(element.idClient ??= 0).then((value) => element.client = value);
          _serviceRepository.GetTypeServiceById(element.idService ??= 0).then((value) => element.typeService = value);
        });
      });
    });
  }

  _calendarpageState() {
    InicializeFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendario"),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.utc(2022, 01, 01),
                lastDate: DateTime.utc(2050, 01, 01),
                onDateChanged: (DateTime value) {
                  setState(() {
                    _workTaskRepository.GetAllByDate(value).then((list) {
                      setState(() {
                        workTasks = list;
                        workTasks.forEach((element) {
                          _clientRepository.GetClientById(element.idClient ??= 0)
                              .then((value) => element.client = value);
                          
                          _serviceRepository.GetTypeServiceById(element.idService ??= 0).then((value) => element.typeService = value);
                        });
                      });
                    });

                    dateSelected = value.toString().split(' ')[0];
                  });
                },
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              Text("Horarios marcados em $dateSelected"),
              const Divider(),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: workTasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 226, 226, 226),
                    child: ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: Text(workTasks[index].client != null ? workTasks[index].client!.name.toString() : ""),
                      subtitle: Text(
                          workTasks[index].typeService != null ? workTasks[index].typeService!.name.toString() : ""),
                      trailing: Text("${workTasks[index].dateInitial?.hour}:${workTasks[index].dateInitial?.minute}"),
                      onTap: () {
                        WorkTask taskSelected = workTasks[index];
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => AlterWorkPage(workTask: taskSelected)));
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddWorkPage(dateSelected: dateSelected))),
      ),
    );
  }
}
