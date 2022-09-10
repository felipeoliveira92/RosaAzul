import 'package:appsalao/models/user.dart';
import 'package:appsalao/pages/Generic/alterfields.page.dart';
import 'package:appsalao/pages/User/login.page.dart';
import 'package:appsalao/repositories/user.repository.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _userRepository = UserRepository();
  var user = User();

  void InicializeFields(){    
    _userRepository.GetUserById(1).then((response) => {
      setState(() {
        user = response;
      })
    });    
  }

  _ProfilePageState() {
    InicializeFields();
    
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(children: <Widget>[
          const SizedBox(
            height: 100,
            child: DrawerHeader(
              child: ListTile(
                leading: Icon(Icons.account_box),
                title: Text("Felipe Rabelo", style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.abc),
            title: const Text("Nome"),
            subtitle: Text("${user.name}"),
            trailing: const Icon(Icons.edit),
            onTap: () {
              Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AlterFields(labelfield: "Nome",valueField: user.name,)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_rounded),
            title: const Text("username"),
            subtitle: Text("${user.username}"),
            trailing: const Icon(Icons.edit),
            onTap: () {
              Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AlterFields(labelfield: "username",valueField: user.username,)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text("email"),
            subtitle: Text("${user.email}"),
            trailing: const Icon(Icons.edit),
            onTap: () {
              Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AlterFields(labelfield: "email",valueField: user.email,)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.password),
            title: const Text("password"),
            subtitle: Text("${user.password}"),
            trailing: const Icon(Icons.edit),
            onTap: () {
              Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AlterFields(labelfield: "Password",valueField: user.password,)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Sign-out"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ]),
      ),
    );
  }
}

