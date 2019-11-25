import 'package:flutter/material.dart';
import 'package:projeto_teste/models/user.dart';
import 'package:projeto_teste/services/auth.dart';
import 'package:projeto_teste/widget/custom_drawer.dart';

class Perfil extends StatefulWidget {
  static const String routeName = '/perfil';
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
User _currentUser;

  @override
  void initState() {
    super.initState();
    Auth.getUserLocal().then((user) {
      setState(() {
        _currentUser = user;
        print('Current user: ${_currentUser.toJson()}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: CustomDrawer(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Perfil'),
    );
  }

   Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Form(
        child: Column(
          children: <Widget>[
            _createNameTextField(),
          ],
        ),
      ),
    );
  }

  Widget _createNameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: _currentUser.name , icon: Icon(Icons.person)),
    );
  }
}