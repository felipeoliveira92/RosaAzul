import 'package:appsalao/controllers/usercontroller.dart';
import 'package:appsalao/pages/alterworkpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({Key? key}) : super(key: key);
  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuildListView(),
    );
  }
}

// ignore: non_constant_identifier_names
BuildListView() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: 10,
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
