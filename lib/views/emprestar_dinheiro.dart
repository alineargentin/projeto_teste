import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_teste/models/user.dart';
import 'package:projeto_teste/services/auth.dart';
import 'package:projeto_teste/utils/common.dart';
import 'package:projeto_teste/widget/custom_drawer.dart';

class EmprestarDinheiro extends StatefulWidget {
  static const String routeName = 'emprestar';
  @override
  _EmprestarDinheiroState createState() => _EmprestarDinheiroState();
}

class _EmprestarDinheiroState extends State<EmprestarDinheiro> {
  bool _sel100 = false;
   bool _sel50 = false;
   bool _sel20 = false;
   bool _sel10 = false;
   bool _sel5 = false;
   User _currentUser;
   int _valoremprestimo = 0;
   
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
      title: Text('Empréstimo'),
    );
  }

  Widget _buildBody() {
    if (_currentUser == null) return Common.progressContainer();
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Form(
        child: Column(
          children: <Widget>[
            new Text("Escolha o valor do empréstimo"),
            new CheckboxListTile(
              title: new Text("100"),
              activeColor: Colors.green,
              secondary: const Icon(Icons.attach_money),
              onChanged: (bool resp100)
              {
                setState((){
                  _sel100 = resp100;
                  _valoremprestimo = 100;
                  _sel50 = false;
                  _sel20 = false;
                  _sel10 = false;
                  _sel5 = false;
                   return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
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
                  message: "Nenhum usuário encontrado");
            else
              return ListView(
                children: snapshot.data.documents.map(_buildCard).toList(),
              );
        }
        return null;
      },
    );
                });
              },
              value: _sel100,
            ),
           new CheckboxListTile(
              title: new Text("50"),
              activeColor: Colors.green,
              secondary: const Icon(Icons.attach_money),
              onChanged: (bool resp50)
              {
                setState((){
                  _sel50 = resp50;
                  _valoremprestimo = 50;
                  _sel100 = false;
                  _sel20 = false;
                  _sel10 = false;
                  _sel5 = false;
                  return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
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
                  message: "Nenhum usuário encontrado");
            else
              return ListView(
                children: snapshot.data.documents.map(_buildCard).toList(),
              );
        }
        return null;
      },
    );
                });
              },
              value: _sel50,
            ),
            new CheckboxListTile(
              title: new Text("20"),
              activeColor: Colors.green,
              secondary: const Icon(Icons.attach_money),
              onChanged: (bool resp20)
              {
                setState((){
                  _valoremprestimo = 20;
                  _sel20 = resp20;
                  _sel100 = false;
                  _sel50 = false;
                  _sel10 = false;
                  _sel5 = false;
                  return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
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
                  message: "Nenhum usuário encontrado");
            else
              return ListView(
                children: snapshot.data.documents.map(_buildCard).toList(),
              );
        }
        return null;
      },
    );
                });
              },
              value: _sel20,
            ),
            new CheckboxListTile(
              title: new Text("10"),
              activeColor: Colors.green,
              secondary: const Icon(Icons.attach_money),
              onChanged: (bool resp10)
              {
                setState((){
                  _valoremprestimo = 10;
                  _sel10 = resp10;
                  _sel100 = false;
                  _sel50 = false;
                  _sel20 = false;
                  _sel5 = false;
return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
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
                  message: "Nenhum usuário encontrado");
            else
              return ListView(
                children: snapshot.data.documents.map(_buildCard).toList(),
              );
        }
        return null;
      },
    );
                });
              },
              value: _sel10,
            ),
            new CheckboxListTile(
              title: new Text("5"),
              activeColor: Colors.green,
              secondary: const Icon(Icons.attach_money),
              onChanged: (bool resp5)
              {
                setState((){
                  _sel5 = resp5;
                  _valoremprestimo =5;
                  _sel100 = false;
                  _sel50 = false;
                  _sel20 = false;
                  _sel10 = false;
                  return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
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
                  message: "Nenhum usuário encontrado");
            else
              return ListView(
                children: snapshot.data.documents.map(_buildCard).toList(),
              );
        }
        return null;
      },
    );
                });
              },
              value: _sel5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(document) {
    final user = User.fromDocument(document);
    return ListTile(
        leading: Icon(Icons.person),
      title: Text(user?.name ?? ''),
      onTap: _emprestar,
          );
        }
      
         void _emprestar() {
     _currentUser.saldo + _valoremprestimo;

  }
       
}
