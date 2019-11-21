import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_teste/models/emprestimo.dart';
import 'package:projeto_teste/models/user.dart';
import 'package:projeto_teste/services/auth.dart';
import 'package:projeto_teste/utils/common.dart';
import 'package:projeto_teste/widget/custom_drawer.dart';

class Pagamento extends StatefulWidget {
  static const String routeName = 'pagamento';
  @override
  _PagamentoState createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
   User _currentUser;
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
    );
  }


   Widget _buildAppBar() {
    return AppBar(
      title: Text('Pagamento'),
    );
  }

  Widget _buildBody() {
     return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('emprestimo')
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
                  message: "Nenhum empréstimo encontrado!");
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
     _emprestimo = Emprestimo.fromDocument(document);
    return ListTile(
      title: Text(_emprestimo?.valor ?? ''),
       onTap: _pagar,
           );
         }
       
       
         void _pagar() {
         _currentUser.saldo - _emprestimo.valor;
  }
}
