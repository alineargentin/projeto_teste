import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_teste/models/emprestimo.dart';
import 'package:projeto_teste/models/user.dart';
import 'package:projeto_teste/services/auth.dart';
import 'package:projeto_teste/utils/common.dart';
import 'package:projeto_teste/views/EmprestimoCadastro.dart';
import 'package:projeto_teste/widget/custom_drawer.dart';

class Pagamento extends StatefulWidget {
  static const String routeName = 'pagamento';
  
  _PagamentoState createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
 
  User _currentUser;
  User _emprestouUser;
  Emprestimo _emprestimo;

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
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Pagamento'),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      label: Text('Realizar empréstimo'),
      icon: Icon(Icons.money_off),
      onPressed: _emprestar,
    );
  }

  Future _emprestar() async {
    await Navigator.of(context).pushNamed(EmprestimoCadastro.routeName);
  }

  Widget _buildBody() {
    if (_currentUser == null) return Common.progressContainer();
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('boleto')
          .where('recebeUserId', isEqualTo: _currentUser.userId)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return Common.errorContainer(error: snapshot.error);
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Common.progressContainer();
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.data.documents.length == 0)
              return Common.emptyContainer(
                  message: "Nenhum Empréstimo encontrado!");
            else
              return ListView(
                children: snapshot.data.documents.map(_buildCard).toList(),
              );
        }
        return null;
      },
    );
  }

  Widget _buildCard(document) {
    final emprestimo = Emprestimo.fromDocument(document);
    return ListTile(
      title: Text(emprestimo.description),
      subtitle: Text("RS " + emprestimo.valor),
      onTap: _pagar,
    );
  }
void _pagar(){
    _currentUser.saldo = (int.parse(_currentUser.saldo)   - int.parse(_emprestimo.valor)) as String;
    _emprestouUser.saldo = (int.parse(_emprestouUser.saldo) + int.parse(_emprestimo.valor)) as String ;
  }
}
