import 'package:flutter/material.dart';
import 'package:projeto_teste/views/cadastro.dart';
import 'package:projeto_teste/views/menu.dart';

class Login extends StatefulWidget {
static const String routeName = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _result;

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
      _result = 'Informe seus dados';
    });
  }

  void doLogin() {
    String email = _emailController.text;
    String password = _passwordController.text;

    setState(() {
      _result = "login: " + email + "\nSenha: " + password;
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
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'E-mail'),
                      controller: _emailController,
                      validator: (text) {
                        return text.isEmpty ? "Insira seu e-mail" : null;
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
