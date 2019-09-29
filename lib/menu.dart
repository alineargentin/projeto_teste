import 'package:flutter/material.dart';
import 'package:projeto_teste/emprestar_dinheiro.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    resetFields();
  }

// INFORME OS DADOS - TEXTO
  void resetFields() {
    _loginController.text = '';
   _passwordController.text = '';
    setState(() {
      // _result = 'Informe seus dados';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //TITULO DO PROJETO
          title: Text('Menu'),
          //COR DO PROJETO
          backgroundColor: Colors.green,
          //ICONE PARA VOLTAR
          actions: <Widget>[
            
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
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 36.0),
                        child: Container(
                            height: 50,
                            //botao do login
                            child: RaisedButton(
                              color: Colors.green,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Menu()),
                                );
                                // if (_formKey.currentState.validate()) {
                                // doLogin();
                                //}
                              },
                              child: Text('Pagar',
                                  style: TextStyle(color: Colors.white)),
                            ))),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 36.0),
                        child: Container(
                            height: 50,
                            //botao do login
                            child: RaisedButton(
                              color: Colors.green,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Menu()),
                                );
                                // if (_formKey.currentState.validate()) {
                                // doLogin();
                                //}
                              },
                              child: Text('Emprestimo',
                                  style: TextStyle(color: Colors.white)),
                            ))),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 36.0),
                        child: Container(
                            height: 50,
                            //botao do login
                            child: RaisedButton(
                              color: Colors.green,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Menu()),
                                );
                                // if (_formKey.currentState.validate()) {
                                // doLogin();
                                //}
                              },
                              child: Text('Adicionar amigos',
                                  style: TextStyle(color: Colors.white)),
                            ))),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 36.0),
                        child: Container(
                            height: 50,
                            //botao do login
                            child: RaisedButton(
                              color: Colors.green,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EmprestarDinheiro()),
                                );
                                // if (_formKey.currentState.validate()) {
                                // doLogin();
                                //}
                              },
                              child: Text('Emprestar',
                                  style: TextStyle(color: Colors.white)),
                            ))),
                  ],
                ))));
  }
}
