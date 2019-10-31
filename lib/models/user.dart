import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userId;
  String name;
  String email;
  String phone;
  String cpf;
  String profilePictureUrl;

  User({
    this.userId,
    this.name,
    this.email,
    this.phone,
    this.cpf,
    this.profilePictureUrl,
  });

  factory User.fromDocument(DocumentSnapshot document) {
    return User.fromMap(document.data);
  }

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        userId: json["userID"] == null ? null : json["userID"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        profilePictureUrl: json["profilePictureURL"] == null
            ? null
            : json["profilePictureURL"],
        phone: json["phone"] == null ? null : json["phone"],
        cpf: json["cpf"] == null ? null : json["cpf"],
      );

  Map<String, dynamic> toMap() => {
        "userID": userId == null ? null : userId,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "profilePictureURL":
            profilePictureUrl == null ? null : profilePictureUrl,
        "phone" : phone == null ? null : phone,
         "cpf" : cpf == null ? null :cpf,   
      };
}
