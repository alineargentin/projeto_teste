import 'package:flutter/material.dart';
import 'package:projeto_teste/views/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
    ));

    

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
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffED213A),
            Color(0xff93291E)
          ],
        ),
        navigateAfterSeconds: Login(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icon/logo.png"),
            fit: BoxFit.none,
          ),
        ),
      ),
    ],
  );
}



