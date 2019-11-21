import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_teste/views/emprestar_dinheiro.dart';
import 'package:projeto_teste/views/pagamento.dart';
import 'package:projeto_teste/views/cadastro.dart';
import 'package:projeto_teste/views/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_teste/views/menu.dart';
import 'package:projeto_teste/views/perfil.dart';
import 'package:projeto_teste/views/sobre.dart';
import 'package:projeto_teste/views/termo.dart';
import 'package:splashscreen/splashscreen.dart';

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
      home: MyHomePage(),
      
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
       Cadastro.routeName:(context) => new Cadastro(),
       Login.routeName:(context) => new Login(),
       Menu.routeName:(context) => new Menu(),
       Termo.routeName:(context) => new Termo(),
       Perfil.routeName:(context) => new Perfil(),
       Sobre.routeName:(context) => new Sobre(),
       EmprestarDinheiro.routeName:(context) => new EmprestarDinheiro(),
       Pagamento.routeName:(context) => new Pagamento(),
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 3,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff2e8b57),
            Color(0xff2e8b57)
          ],
        ),
        navigateAfterSeconds: Login(),
        loaderColor: Colors.green,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icon/splashscreen.png"),
            fit: BoxFit.none,
          ),
        ),
      ),
    ],
  );
  
}

