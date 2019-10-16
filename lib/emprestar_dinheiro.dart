import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

import 'menu.dart';

class EmprestarDinheiro extends StatefulWidget {
  @override
  _EmprestarDinheiroState createState() => _EmprestarDinheiroState();
}

class _EmprestarDinheiroState extends State<EmprestarDinheiro> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    resetFields();
  }

// INFORME OS DADOS - TEXTO
  void resetFields() {
    _emailController.text = '';
    _passwordController.text = '';
    setState(() {
      // _result = 'Informe seus dados';
    });
  }

  Future showContacts() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);
    developer.log(permission.toString());
    if (PermissionStatus.granted != permission) {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.contacts]);
      if (PermissionStatus.granted != permissions[PermissionGroup.contacts]) {
        // TODO criar alerta
        developer.log("Mostrar alerta dizendo que deu ruim");
        return;
      }
    }

    // Obtém todos os contatos do dispositivo
    Iterable<Contact> contacts = await ContactsService.getContacts();
    for (Contact contact in contacts) {
      developer.log(contact.displayName);
    }
/*
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Menu()),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //TITULO DO PROJETO
          title: Text('Emprestar dinheiro'),
          //COR DO PROJETO
          backgroundColor: Colors.green,
          //ICONE PARA VOLTAR
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                resetFields();
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: 'Valor'),
                      controller: _emailController,
                      validator: (text) {
                        return text.isEmpty ? "Insira o valor" : null;
                      },
                    ),
                    ListTile(
                        leading: Icon(Icons.people),
                        title: Text('Amigos'),
                        onTap: () {
                          showContacts();
                        }),
                    ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text('Data de devolução'),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 36.0),
                        child: Container(
                            height: 50,
                            //botao do login
                            child: RaisedButton(
                              color: Colors.green,
                              onPressed: () {
                                //if (_formKey.currentState.validate()) {
                                // doLogin();
                                // }
                              },
                              child: Text('Publicar',
                                  style: TextStyle(color: Colors.white)),
                            ))),
                  ],
                ))));
  }
}
