import 'package:appsalao/repositories/clientrepository.dart';
import 'package:flutter/material.dart';
import 'newalterworkpage.dart';

class calendarpage extends StatefulWidget {
  const calendarpage({Key? key}) : super(key: key);
  _calendarpageState createState() => _calendarpageState();
}

class _calendarpageState extends State<calendarpage> {
  @override
  Widget build(BuildContext context) {
    final lista = ClientRepository.listaClient;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendario"),
        elevation: 20,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NewAlterWorkPage()));
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
                    onDateChanged: (DateTime value) {},
                  ),
              
              Divider(),
              Text("Horarios hoje"),
              Divider(),
      
              ListView.builder(
                      shrinkWrap: true,
                      itemCount: lista.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.account_circle),
                          title: Text(lista[index].name),
                          subtitle: Text(lista[index].workTask),
                          trailing: Text(lista[index].date),
                          onTap: () {
                            Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const NewAlterWorkPage()));
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
