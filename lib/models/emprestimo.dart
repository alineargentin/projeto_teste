import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Emprestimo {
  final String description;
  final String valor;
  final String date;
  final String emprestarUserId;
  final String recebeUserId;

  Emprestimo({
    this.description,
    this.valor,
    this.date,
    this.emprestarUserId,
    this.recebeUserId,
  });

  factory Emprestimo.fromDocument(DocumentSnapshot document) {
    return Emprestimo.fromMap(document.data);
  }

  factory Emprestimo.fromJson(String str) =>
      Emprestimo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Emprestimo.fromMap(Map<String, dynamic> json) => Emprestimo(
        description: json["description"] == null ? null : json["description"],
        valor: json["valor"] == null ? null : json["valor"],
        date: json["date"] == null ? null : json["date"],
        emprestarUserId:
            json["emprestarUserId"] == null ? null : json["emprestarUserId"],
            recebeUserId:
            json["recebeUserId"] == null ? null : json["recebeUserId"],
      );

  Map<String, dynamic> toMap() => {
        "description": description == null ? null : description, 
        "valor": valor == null ? null : valor,
        "date": date == null ? null : date,
        "emprestarUserId": emprestarUserId == null ? null : emprestarUserId,
         "recebeUserId": recebeUserId == null ? null : recebeUserId,
      };
}