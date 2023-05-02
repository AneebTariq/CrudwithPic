import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operation/models/usermodel.dart';
import 'package:crud_operation/ui/screens/read_data_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Userrepository {
  static Userrepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  // ignore: non_constant_identifier_names
  CreateUser(User user) async {
    await _db.collection('Users').add(user.tojason()).whenComplete(() {
      Get.snackbar(
        'Success',
        'your form saved',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Get.off(() => const Readscreen());
      // ignore: body_might_complete_normally_catch_error
    }).catchError((error, stackTrace) {
      Get.snackbar(
        'Error',
        'Someting went wrong. Try Again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      // ignore: avoid_print
      print(error.toString());
    });
  }

// tofetch all user data
  Future<List<User>> alluser() async {
    final snapshot = await _db.collection('Users').get();
    final userdata = snapshot.docs.map((e) => User.fromSnapshot(e)).toList();
    return userdata;
  }

  //fetch data of one user
  Future<User> getuserdetail(String name) async {
    final snapshot =
        await _db.collection('Users').where('Name', isEqualTo: name).get();
    final userdata = snapshot.docs.map((e) => User.fromSnapshot(e)).single;
    return userdata;
  }
}
