import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Opções';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Emprestar'),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Pagar'),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Adicionar Amigos'),
            ),
            ListTile(
              leading: Icon(Icons.money_off),
              title: Text('Emprestimo'),
            ),
          ],
        ),
      ),
    );
  }
}