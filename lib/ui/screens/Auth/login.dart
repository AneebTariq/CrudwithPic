import 'package:crud_operation/ui/screens/Auth/register.dart';
import 'package:crud_operation/ui/screens/read_data_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Userlogin extends StatefulWidget {
  const Userlogin({super.key});

  @override
  State<Userlogin> createState() => _UserloginState();
}

class _UserloginState extends State<Userlogin> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                // ignore: unused_local_variable
                final credential =
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailcontroller.text,
                  password: passwordcontroller.text,
                );

                Get.offAll(() => const Readscreen());
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  Get.snackbar('Wrong', ' Please Enter Correct Email/Password ',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM);
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                  Get.snackbar('Wrong Password', ' Enter Correct Password ',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM);
                }
              }
            },
            child: const Text('Login'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    Get.to(() => const Userregister());
                  },
                  child: const Text('Register')),
            ],
          )
        ],
      ),
    );
  }
}
