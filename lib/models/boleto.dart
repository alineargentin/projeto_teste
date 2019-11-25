import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Boleto {
  final String title;
  final String valor;
  final String date;
  final String finderUserId;

  Boleto({
    this.title,
    this.valor,
    this.finderUserId,
    this.date,
  });

  factory Boleto.fromDocument(DocumentSnapshot document) {
    return Boleto.fromMap(document.data);
  }

  factory Boleto.fromJson(String str) =>
      Boleto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Boleto.fromMap(Map<String, dynamic> json) => Boleto(
        title: json["title"] == null ? null : json["title"],
        valor: json["valor"] == null ? null : json["valor"],
        date: json["date"] == null ? null : json["date"],
        finderUserId:
            json["finderUserId"] == null ? null : json["finderUserId"],
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "valor": valor == null ? null : valor,
         "date": date == null ? null : date,
        "finderUserId": finderUserId == null ? null : finderUserId,
      };
}
