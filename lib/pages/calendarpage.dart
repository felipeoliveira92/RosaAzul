import 'dart:convert';

import 'package:appsalao/controllers/api.dart';
import 'package:appsalao/models/user.dart';
import 'package:appsalao/models/worktask.dart';
import 'package:appsalao/pages/addworkpage.dart';
import 'package:appsalao/repositories/clientrepository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'alterworkpage.dart';

class calendarpage extends StatefulWidget {
  const calendarpage({Key? key}) : super(key: key);
  _calendarpageState createState() => _calendarpageState();
}

class _calendarpageState extends State<calendarpage> {
  List<User> users = [];
  User user = new User();
  List<WorkTask> workTasks = [];
  var dateSelected = DateTime.now().day.toString();

  // _getUsers() {
  //   API.getUsers().then((response) {
  //     setState(() {
  //       Iterable listausers = json.decode(response.body);
  //       users = listausers.map((model) => User.fromJson(model)).toList();
  //     });
  //   });
  // }

  // _getUsersById(int id) {
  //   API.getUsersById(id).then((response) {
  //     setState(() {
  //       var objuser = json.decode(response.body);
  //       user = objuser.map((model) => User.fromJson(model)).toList();
  //     });
  //   });
  // }

  // _getWorkTasks() {
  //   API.getWorkTasks().then((response) {
  //     setState(() {
  //       Iterable objWork = json.decode(response.body);
  //       workTasks = objWork.map((model) => WorkTask.fromJson(model)).toList();
  //     });
  //   });
  // }

  _getWorkTasksById(int id) {
    API.getWorkTasksById(id).then((response) {
      setState(() {
        workTasks = [];

        if (response != null) {
          var objWork = json.decode(response.body);
          workTasks.add(WorkTask.fromJson(objWork));
        }
      });
    });
  }

  _calendarpageState() {
    _getWorkTasksById(DateTime.now().day);
  }

  @override
  Widget build(BuildContext context) {
    final lista = ClientRepository.listaClient;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendario"),
        elevation: 20,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddWorkPage(dateSelected : dateSelected)));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                    _getWorkTasksById(value.day);
                    dateSelected = value.toString().split(' ')[0];                    
                  });
                },
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              const Text("Horarios hoje"),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: workTasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: Text(workTasks[index].nomeCliente.toString()),
                    subtitle: Text(workTasks[index].descricao.toString()),
                    trailing: Text(workTasks[index].horario.toString()),
                    onTap: () {
                      WorkTask taskSelected = workTasks[index];
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AlterWorkPage(workTask : taskSelected)));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
