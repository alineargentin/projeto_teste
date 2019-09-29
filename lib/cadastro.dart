import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
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
      //TO DO não mudar o state, fazer o login no firebase
      _result = "Cadastro: " + login + "\nSenha: " + password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //TITULO DO PROJETO
          title: Text('Cadastro'),
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
                    /*TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: 'Nº do Cartão'),
                      controller: _loginController,
                      validator: (text) {
                        return text.isEmpty
                            ? "Adicione o número do cartão"
                            : null;
                      },
                    ),*/
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Nome'),
                      controller: _passwordController,
                      validator: (text) {
                        return text.isEmpty ? "Insira seu nome!" : null;
                      },
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Celular'),
                        controller: _passwordController,
                        validator: (text) {
                          return text.isEmpty ? "Insira seu Celular" : null;
                        }),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'CPF'),
                        controller: _passwordController,
                        validator: (text) {
                          return text.isEmpty ? "Insira seu CPF" : null;
                        }),
                         TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'E-mail'),
                      controller: _passwordController,
                      validator: (text) {
                        return text.isEmpty ? "Insira seu e-mail!" : null;
                      }),
                       TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Senha'),
                      controller: _passwordController,
                      validator: (text) {
                        return text.isEmpty ? "Insira sua senha!" : null;
                      }),
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
                                if (_formKey.currentState.validate()) {
                                  doLogin();
                                }
                              },
                              child: Text('Cadastrar',
                                  style: TextStyle(color: Colors.white)),
                            ))),
                  ],
                ))));
  }
}
