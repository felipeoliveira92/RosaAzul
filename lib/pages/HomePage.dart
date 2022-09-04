import 'package:appsalao/pages/calculatepage.dart';
import 'package:appsalao/pages/calendarpage.dart';
import 'package:appsalao/pages/historic.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuildListView(),
    );
  }

  // ignore: non_constant_identifier_names
  BuildListView() {
    return ListView(
      children: <Widget>[
        DrawerHeader(
              // ignore: sort_child_properties_last
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      leading: Image.asset("images/logo-s-fundo.png", height: 100),
                      title: const Text("Felipe Rabelo", style: TextStyle(color: Colors.white)),
                      subtitle: const Text("Opções.", style: TextStyle(color: Colors.white)),
                      
                      onTap: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const calendarpage()));
                      },
                    ),
                  ),

                  Expanded(
                    child: Image.asset("images/logo-s-fundo.png", height: 300),
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),
        ),

        ListTile(
          leading: const Icon(Icons.calculate_rounded),
          title: const Text("Calculadora"),
          subtitle: const Text("Calcule quanto ira gastar."),
          onTap: () {
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const calculatepage()));
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.calendar_month),
          title: const Text("Calendario"),
          subtitle: const Text("Veja e marque horarios."),
          onTap: () {
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const calendarpage()));
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.money),
          title: const Text("Faturamento"),
          subtitle: const Text("Veja quanto esta lucrando."),
          onTap: () {
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HistoricPage()));
          },
        ),
      ],
    );
  }
}
