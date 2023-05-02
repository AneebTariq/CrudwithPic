import 'package:crud_operation/ui/screens/add_data_screen.dart';
import 'package:crud_operation/ui/screens/read_data_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class Userregister extends StatefulWidget {
  const Userregister({super.key});

  @override
  State<Userregister> createState() => _UserregisterState();
}

class _UserregisterState extends State<Userregister> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: emailcontroller,
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: passwordcontroller,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final credential =
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: emailcontroller.text,
                  password: passwordcontroller.text,
                );

                Get.offAll(() => const AddData());
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                  Get.snackbar('Weak Password', ' Enter Strong Password ',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM);
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                  Get.snackbar('Wrong Email', ' Enter another Email ',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM);
                }
              } catch (e) {
                print(e);
              }
            },
            child: const Text('Register'),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    Get.to(() => const Userlogin());
                  },
                  child: const Text('login')),
            ],
          )
        ],
      ),
    );
  }
}
