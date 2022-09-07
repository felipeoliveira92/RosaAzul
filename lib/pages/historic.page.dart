import 'package:appsalao/models/worktask.dart';
import 'package:appsalao/repositories/worktask.repository.dart';
import 'package:flutter/material.dart';
import 'package:date_ranger/date_ranger.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({Key? key}) : super(key: key);
  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  var initialDate = DateTime.now();
  var initialDateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  final _workTaskRepository = WorkTaskRepository();
  List<WorkTask> workTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Faturamento"),      
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                DateRanger(
                    initialRange: initialDateRange,
                    onRangeChanged: (range) {
                      _workTaskRepository.GetWorkTaskByFilter(initialDateRange.start, initialDateRange.end)
                        .then((list) {
                          setState(() {
                            initialDateRange = range;
                            workTasks = list;
                          });
                        },
                      );
                    }),
                BuildListView(workTasks),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
BuildListView(List<WorkTask> listWorkTasks) {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: listWorkTasks.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: const Icon(Icons.account_circle),
        title: Text("TItulo $index"),
        subtitle: Text("Subtitulo $index"),
        trailing: Text("Trailing $index"),
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => login()));
        },
      );
    },
  );
}
