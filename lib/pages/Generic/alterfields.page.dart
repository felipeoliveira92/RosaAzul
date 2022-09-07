import 'package:flutter/material.dart';

class AlterFields extends StatefulWidget {
  var labelfield;
  var valueField;

  AlterFields({Key? key, this.labelfield, this.valueField}) : super(key: key);

  @override
  State<AlterFields> createState() => _AlterFieldsState();
}

class _AlterFieldsState extends State<AlterFields> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Text(
                "Editar ${widget.labelfield != null ? widget.labelfield : ''}",
                style: TextStyle(fontSize: 20),
              )),
              TextFormField(
                initialValue: widget.valueField != null ? widget.valueField : '',
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Salvar', style: TextStyle(fontSize: 20)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
