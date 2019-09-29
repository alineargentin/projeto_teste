import 'package:flutter/material.dart';
import 'package:projeto_teste/cadastro.dart';
import 'package:projeto_teste/menu.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _result;

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
      _result = 'Informe seus dados';
    });
  }

  void doLogin() {
    String login = _loginController.text;
    String password = _passwordController.text;

    setState(() {
      _result = "login: " + login + "\nSenha: " + password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //TITULO DO PROJETO
          title: Text('Carteira Virtual'),
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
                      decoration: InputDecoration(labelText: 'Login'),
                      controller: _loginController,
                      validator: (text) {
                        return text.isEmpty ? "Insira seu login" : null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Senha'),
                      controller: _passwordController,
                      validator: (text) {
                        return text.isEmpty ? "Insira sua senha!" : null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 36.0),
                      child: Text(
                        _result,
                        textAlign: TextAlign.center,
                      ),
                    ),
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
                                if (_formKey.currentState.validate()) {
                                  doLogin();
                                }
                              },
                              child: Text('Login',
                                  style: TextStyle(color: Colors.white)),
                            ))),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Container(
                            height: 50,
                            //botao do cadastra-se
                            child: RaisedButton(
                              color: Colors.green,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cadastro()),
                                );
                                // if (_formKey.currentState.validate()) {
                                //  doLogin();
                              },
                              child: Text('Cadastrar',
                                  style: TextStyle(color: Colors.white)),
                            ))),
                  ],
                ))));
  }
}
