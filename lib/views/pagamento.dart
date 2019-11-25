import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_teste/models/boleto.dart';
import 'package:projeto_teste/models/user.dart';
import 'package:projeto_teste/services/auth.dart';
import 'package:projeto_teste/utils/common.dart';
import 'package:projeto_teste/widget/custom_drawer.dart';

import 'boleto_cadastro.dart';

class Pagamento extends StatefulWidget {
  static const String routeName = 'pagamento';
  
  _PagamentoState createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
 
  
  User _currentUser;
  Boleto _boleto;

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
      label: Text('Cadastrar boleto'),
      icon: Icon(Icons.money_off),
      onPressed: _cadastrarBoleto,
    );
  }

  Future _cadastrarBoleto() async {
    await Navigator.of(context).pushNamed(BoletoCadastro.routeName);
  }

  Widget _buildBody() {
    if (_currentUser == null) return Common.progressContainer();
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('boleto')
          .where('finderUserId', isEqualTo: _currentUser.userId)
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
                  message: "Nenhum Boleto encontrado!");
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
    final boleto = Boleto.fromDocument(document);
    return ListTile(
      title: Text(boleto.title),
      subtitle: Text("RS " + boleto.valor),
      onTap: _pagar,
    );
  }

  void _pagar(){
    _currentUser.saldo - int.parse(_boleto.valor);
  }
}
