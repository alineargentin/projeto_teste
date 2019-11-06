import 'package:flutter/material.dart';
import 'package:projeto_teste/services/auth.dart';
import 'package:projeto_teste/models/user.dart';
import 'package:projeto_teste/views/login.dart';

class Cadastro extends StatefulWidget {
  static const String routeName = '/cadastro';

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _nameController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final _confirmPasswordController = new TextEditingController();
  final _phoneController = new TextEditingController();
  final _cpfController = new TextEditingController();
  final _cartaoController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _showNameTextField(),
              _showEmailTextField(),
              _showPasswordTextField(),
              _showConfirmPasswordTextField(),
              _showPhoneTextField(),
              _showCPFTextField(),
              _showCartaoTextField(),
              _showSignUpButton(),
            ],
          ),
        ),
      ),
    );
  }

Widget _showNameTextField() {
    return TextField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Nome',
        prefixIcon: Icon(Icons.person),
      ),
    );
  }

  Widget _showEmailTextField() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

  Widget _showPasswordTextField() {
    return TextField(
      controller: _passwordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Senha',
        prefixIcon: Icon(Icons.vpn_key),
      ),
    );
  }

   Widget _showConfirmPasswordTextField() {
    return TextField(
      controller: _confirmPasswordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Confirmar senha',
        prefixIcon: Icon(Icons.vpn_key),
      ),
    );
  }

Widget _showPhoneTextField() {
    return TextField(
      controller: _phoneController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Celular',
        prefixIcon: Icon(Icons.phone_android),
      ),
    );
  }

Widget _showCPFTextField() {
    return TextField(
      controller: _cpfController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'CPF',
        prefixIcon: Icon(Icons.tab),
      ),
    );
  }

Widget _showCartaoTextField() {
    return TextField(
      controller: _cartaoController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Cartão de Crédito',
        prefixIcon: Icon(Icons.credit_card),
      ),
    );
  }
  

Future _signUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    await Auth.signUp(email, password).then(_onResultSignUpSuccess);
  }
  void _onResultSignUpSuccess(String userId) {
    final email = _emailController.text;
    final name = _nameController.text;
    final user = User(userId: userId, name: name, email: email);
    Auth.addUser(user);
    Navigator.of(context).pushReplacementNamed(Login.routeName);
  }

  Widget _showSignUpButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: RaisedButton(child: Text('Cadastrar'), onPressed: _signUp),
    );
  }
}
