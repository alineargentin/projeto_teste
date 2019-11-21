import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Emprestimo {
  final int valor;
  final String finderUserId;

  Emprestimo({
    this.valor,
    this.finderUserId,
  });


  factory Emprestimo.fromDocument(DocumentSnapshot document) {
    return Emprestimo.fromMap(document.data);
  }

  factory Emprestimo.fromJson(String str) =>
      Emprestimo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Emprestimo.fromMap(Map<String, dynamic> json) => Emprestimo(
        valor: json["valor"] == null ? null : json["valor"],
        finderUserId:
            json["finderUserId"] == null ? null : json["finderUserId"],
      );

  Map<String, dynamic> toMap() => {
        "valor": valor == null ? null : valor,
        "finderUserId": finderUserId == null ? null : finderUserId,
      };
}
