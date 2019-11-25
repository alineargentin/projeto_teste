import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_teste/models/boleto.dart';
import 'package:projeto_teste/models/user.dart';
import 'package:projeto_teste/services/auth.dart';

class BoletoCadastro extends StatefulWidget {
  static const String routeName = '/boleto';

  final Boleto emprestimo;

  BoletoCadastro({this.emprestimo});

  @override
  _BoletoCadastro createState() => _BoletoCadastro();
}

class _BoletoCadastro extends State<BoletoCadastro> {
  final _formKey = new GlobalKey<FormState>();
  final _titleController = new TextEditingController();
  final _valorController = new TextEditingController();
  final _dateController = new TextEditingController();
  final _dateFormat = DateFormat("dd/MM/yyyy");
  final _initialDateValue = DateTime.now();

  User _localUser;
  Boleto _boleto = new Boleto();

  @override
  void initState() {
    super.initState();

    if (widget.emprestimo != null) {
      _boleto = Boleto.fromMap(widget.emprestimo.toMap());
      _titleController.text = _boleto.title;

      _valorController.text = _boleto.valor;
      _dateController.text = _boleto.date;
    }

    _loadLocalUser();
  }

  Future _loadLocalUser() async {
    final user = await Auth.getUserLocal();
    setState(() {
      _localUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Cadastrar boleto'),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      label: Text('Salvar boleto'),
      icon: Icon(Icons.money_off),
      onPressed: _save,
    );
  }

  Future _save() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      _boleto = new Boleto(
        title: _titleController.text,
        valor: _valorController.text,
        date: _dateController.text,
        finderUserId: _localUser.userId,
      );

      print('Saving ${_boleto.toJson()}');

      await Firestore.instance
          .collection('boleto')
          .add(_boleto.toMap())
          .then(_onSaveDataSuccess)
          .catchError(_onSaveDataFailure);
    }
  }

  void _onSaveDataSuccess(result) {
    Navigator.pop(context, result);
  }

  void _onSaveDataFailure(error) {
    print('Error ${error.toString()})');

    Flushbar(
      title: 'Erro',
      message: error.toString(),
      duration: Duration(seconds: 3),
    )..show(context);
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitleTextField(),
            _buildValorTextField(),
            _buildDateTextField(),
          ],
        ),
      ),
    );
  }

   Widget _buildTitleTextField() {
    return TextFormField(
      controller: _titleController,
      maxLines: 1,
      decoration: InputDecoration(
        labelText: 'Título',
        prefixIcon: Icon(Icons.title),
      ),
      validator: (text) => text.isEmpty ? 'Título inválido' : null,
    );
  }

  Widget _buildValorTextField() {
    return TextFormField(
      controller: _valorController,
      maxLines: 1,
      decoration: InputDecoration(
        labelText: 'Valor',
        prefixIcon: Icon(Icons.attach_money),
      ),
      validator: (text) => text.isEmpty ? 'Valor inválido' : null,
    );
  }

  Widget _buildDateTextField() {
    return DateTimeField(
      controller: _dateController,
      format: _dateFormat,
      initialValue: _initialDateValue,
      decoration: InputDecoration(
        labelText: 'Data',
        prefixIcon: Icon(Icons.date_range),
      ),
      validator: (date) => date == null ? 'Data inválida' : null,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime(2100),
        );
      },
    );
  }
}
