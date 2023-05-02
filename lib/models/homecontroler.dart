import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> userFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    nameController = TextEditingController();
    numberController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
  }

  void checkuserform() {
    final isValid = userFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    userFormKey.currentState!.save();
  }
}
