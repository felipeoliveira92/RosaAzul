// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, deprecated_member_use
import 'package:appsalao/controllers/LoginController.dart';
import 'package:appsalao/pages/Global/HomePage.dart';
import 'package:appsalao/pages/Workflow/addworkpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _seePassword = false;
  final _loginController = LoginController();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  _LoginPageState() {
    _initializeFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("images/logo-s-fundo.png", height: 300),
                  TextFormField(
                    controller: _mailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(labelText: "Email", labelStyle: TextStyle(color: Colors.white)),
                  ),
                  Divider(),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_seePassword,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(_seePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            _seePassword = !_seePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  Divider(),
                  ButtonTheme(
                    height: 60.0,
                    child: RaisedButton.icon(
                      onPressed: () {
                        _loginController.Login(_mailController.text, _passwordController.text).then((result) => {
                              if (result == true)
                              {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()))
                              }
                              else
                              {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('Usuario ou senha, invalidos!'),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.redAccent,
                                ))
                              }
                            });
                      },
                      color: Colors.white,
                      label: Text("ENTRAR"),
                      icon: Icon(Icons.input),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
