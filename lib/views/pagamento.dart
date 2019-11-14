import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';


class Pagamento extends StatefulWidget {
  static const String routeName = 'pagamento';
  @override
  _PagamentoState createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
   

  Future showContacts() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);
    developer.log(permission.toString());
    if (PermissionStatus.granted != permission) {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.contacts]);
      if (PermissionStatus.granted != permissions[PermissionGroup.contacts]) {
        
        developer.log("Mostrar alerta dizendo que deu ruim");
        return;
      }
    }

    // Obtém todos os contatos do dispositivo
    Iterable<Contact> contacts = await ContactsService.getContacts();
    for (Contact contact in contacts) {
      developer.log(contact.displayName);
    }
/*
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Menu()),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

  
}