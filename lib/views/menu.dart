import 'package:flutter/material.dart';
import 'package:projeto_teste/widget/custom_drawer.dart';

class Menu extends StatefulWidget {
  static const String routeName = '/menu';
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: CustomDrawer(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Home'),
    );
  }
}
