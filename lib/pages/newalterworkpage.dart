import 'package:flutter/material.dart';

class NewAlterWorkPage extends StatefulWidget {
  const NewAlterWorkPage({Key? key}) : super(key: key);

  @override
  State<NewAlterWorkPage> createState() => _NewAlterWorkPageState();
}

class _NewAlterWorkPageState extends State<NewAlterWorkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Horario"),
        ),
        elevation: 20,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              
              },
            ),
          ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Data Selecionada: xx/xx/xxxx"),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20,
                      height: 20,
                    ),

                    TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            decoration: InputDecoration(
                                labelText: "Cliente",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                    
                    const SizedBox(
                      width: 20,
                      height: 20,
                    ),

                    TextFormField(
                            keyboardType: TextInputType.text,
                            style: const TextStyle(color: Colors.black, fontSize: 20),
                            decoration: const InputDecoration(
                                labelText: "Trabalho",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                    
                    const SizedBox(
                      width: 20,
                      height: 20,
                    ),

                    TextFormField(
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black, fontSize: 20),
                            decoration: const InputDecoration(
                                labelText: "Preço",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),

                    const SizedBox(
                      width: 20,
                      height: 20,
                    ),

                    TextFormField(
                            keyboardType: TextInputType.datetime,
                            style: const TextStyle(color: Colors.black, fontSize: 20),
                            decoration: const InputDecoration(
                                labelText: "Horario",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                    
                    
                    ],
                  ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
