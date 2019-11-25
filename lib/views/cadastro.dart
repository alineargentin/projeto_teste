import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:projeto_teste/services/auth.dart';
import 'package:projeto_teste/models/user.dart';

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

  final _nameFocusNode = new FocusNode();
  final _emailFocusNode = new FocusNode();
  final _passwordFocusNode = new FocusNode();
  final _confirmPasswordFocusNode = new FocusNode();
  final _phoneFocusNode = new FocusNode();
  final _cpfFocusNode = new FocusNode();

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
      textInputAction: TextInputAction.next,
      autofocus: true,
      focusNode: _nameFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_emailFocusNode),
    );
  }

  Widget _showEmailTextField() {
     return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
      textInputAction: TextInputAction.next,
      focusNode: _emailFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_passwordFocusNode),
    );
  }

  Widget _showPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Senha',
        prefixIcon: Icon(Icons.vpn_key),
      ),
      textInputAction: TextInputAction.next,
      focusNode: _passwordFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_confirmPasswordFocusNode),
    );
  }

   Widget _showConfirmPasswordTextField() {
     return TextFormField(
      controller: _confirmPasswordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Confirmar senha',
        prefixIcon: Icon(Icons.vpn_key),
      ),
      textInputAction: TextInputAction.next,
      focusNode: _confirmPasswordFocusNode,
       onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_phoneFocusNode)
    );
  }

Widget _showPhoneTextField() {
    return TextField(
      controller: _phoneController,
      keyboardType: TextInputType.number,
      maxLength: 11,
      decoration: InputDecoration(
        hintText: 'Celular',
        prefixIcon: Icon(Icons.phone),
      ),
       textInputAction: TextInputAction.next,
      focusNode: _phoneFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_cpfFocusNode)
    );
  }

Widget _showCPFTextField() {
    return TextField(
      controller: _cpfController,
      keyboardType: TextInputType.number,
      maxLength: 11,
      decoration: InputDecoration(
        hintText: 'CPF',
        prefixIcon: Icon(Icons.description),
      ),
      textInputAction: TextInputAction.next,
      focusNode: _cpfFocusNode,
    );
  }

 Future _signUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    await Auth.signUp(email, password)
        .then(_onResultSignUpSuccess)
        .catchError((error) {
      Flushbar(
        title: 'Erro',
        message: error.toString(),
        duration: Duration(seconds: 3),
      )..show(context);
    });
  }
  
  void _onResultSignUpSuccess(String userId) {
    final email = _emailController.text;
    final name = _nameController.text;
    final phone = _phoneController.text;
    final cpf = _cpfController.text;
    final user = User(userId: userId, name: name, email: email, phone: phone, cpf: cpf);
    Auth.addUser(user).then(_onResultAddUser);
  }

   void _onResultAddUser(result) {
    Flushbar(
      title: 'Novo usuário',
      message: 'Usuário registrado com sucesso!',
      duration: Duration(seconds: 2),
    )..show(context);
  }

  Widget _showSignUpButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: RaisedButton(child: Text('Cadastrar'), onPressed: _signUp),
    );
  }
}
