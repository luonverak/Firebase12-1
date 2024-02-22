import 'package:demo_firebase11_12/auth/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final authController = Get.put(AuthController());
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user!.email!),
        actions: [
          IconButton(
            onPressed: () async {
              await authController.singOutAuth();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
