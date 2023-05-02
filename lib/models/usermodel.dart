import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String email;
  String phoneNumber;
  String profilePicUrl;

  User(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.profilePicUrl});

  tojason() {
    return {
      'Name': name,
      'Number': phoneNumber,
      'Email': email,
      'profilePicUrl': profilePicUrl
    };
  }

  factory User.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return User(
      name: data['Name'],
      phoneNumber: data['Number'],
      profilePicUrl: data['profilePicUrl'],
      email: data['Email'],
    );
  }
}
