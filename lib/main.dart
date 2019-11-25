import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_teste/views/pagamento.dart';
import 'package:projeto_teste/views/cadastro.dart';
import 'package:projeto_teste/views/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_teste/views/menu.dart';
import 'package:projeto_teste/views/perfil.dart';
import 'package:projeto_teste/views/sobre.dart';
import 'package:projeto_teste/views/splash.dart';
import 'package:projeto_teste/views/termo.dart';
import 'package:projeto_teste/views/boleto_cadastro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carteira Virtual',
      theme: new ThemeData(
        primarySwatch: Colors.green
        ),
      debugShowCheckedModeBanner: false,
      home: Splash(),
      
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
       Cadastro.routeName:(context) => new Cadastro(),
       Login.routeName:(context) => new Login(),
       Menu.routeName:(context) => new Menu(),
       Termo.routeName:(context) => new Termo(),
       Perfil.routeName:(context) => new Perfil(),
       Sobre.routeName:(context) => new Sobre(),
       Pagamento.routeName:(context) => new Pagamento(),
       Splash.routeName:(context) => new Splash(),
       BoletoCadastro.routeName:(context) => new BoletoCadastro(),
      },

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt'), 
        const Locale('en'), 
        const Locale('es'), 
      ],
      
    );

  }
}



