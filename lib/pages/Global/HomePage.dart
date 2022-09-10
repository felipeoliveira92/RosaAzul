import 'package:appsalao/pages/calculatepage.dart';
import 'package:appsalao/pages/Service/calendarpage.dart';
import 'package:appsalao/pages/Service/historic.page.dart';
import 'package:appsalao/pages/User/profile.page.dart';
import 'package:d_chart/d_chart.dart';
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
      appBar: AppBar(
        elevation: 0,
      ),
      drawer: Drawer(
        child: DrawerListView(context),
      ),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListTile(
                  leading: Image.asset("images/gif-logo.gif", height: 100, width: 50),
                  title: const Text("Felipe Rabelo", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
                  },
                ),
              ),
              Expanded(
                child: Image.asset("images/logo-header.png", height: 300,alignment: Alignment.centerRight)
              ),
            ],
          ),
          decoration: const BoxDecoration(
            color: Colors.deepPurple,
          ),
        ),
        
        const SizedBox(
          height: 100,
        ),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: DChartPie(
            data: const [
              {'domain': 'Entradas', 'measure': 28},
              {'domain': 'Saidas', 'measure': 27},
              {'domain': 'Ionic', 'measure': 20},
              {'domain': 'Cordova', 'measure': 15},
            ],
            fillColor: (pieData, index) {
              switch (pieData['domain']) {
                case 'Entradas':
                  return Colors.green;
                case 'Saidas':
                  return Colors.red;
                case 'Ionic':
                  return Colors.lightBlue;
                default:
                  return Colors.orange;
              }
            },
            pieLabel: (pieData, index) {
              return "${pieData['domain']}:\n${pieData['measure']}%";
            },
            labelPosition: PieLabelPosition.outside,
          ),
        ),
      ],
    );
  }
}

// ignore: non_constant_identifier_names
DrawerListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
          ),
          child: Text(
            'Opções',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
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
          leading: const Icon(Icons.attach_money),
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
