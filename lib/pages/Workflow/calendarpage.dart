// ignore_for_file: camel_case_types

import 'package:appsalao/controllers/WorkTaskController.dart';
import 'package:appsalao/models/user.dart';
import 'package:appsalao/models/worktask.dart';
import 'package:appsalao/pages/Workflow/addworkpage.dart';
import 'package:appsalao/pages/viewModels/worktaskViewModel.dart';
import 'package:flutter/material.dart';
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
  List<WorkTaskViewModel> workTasks = [];

  // ignore: non_constant_identifier_names
  void InicializeFields(DateTime date) {
    _workTaskRepository.GetAllByDate(date).then((list) {
      setState(() {
        workTasks = [];
        workTasks = list;
      });
    });
  }

  _calendarpageState() {
    InicializeFields(DateTime.now().toUtc());
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
                    dateSelected = value.toString().split(' ')[0];
                  });
                  InicializeFields(value);
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
                      title: Text(workTasks[index].client?.name ?? ""),
                      subtitle: Text(workTasks[index].typeService?.name ?? ""),
                      trailing: Text("${workTasks[index].dateInitial?.hour}:${workTasks[index].dateInitial?.minute}"),
                      onTap: () {
                        WorkTaskViewModel taskSelected = workTasks[index];
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => AlterWorkPage(workTask: taskSelected)));
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
            .pushReplacement(MaterialPageRoute(builder: (context) => AddWorkPage(dateSelected: dateSelected))),
      ),
    );
  }
}
