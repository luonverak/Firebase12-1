import 'package:demo_firebase11_12/auth/model/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/view/home_screen.dart';
import '../view/login_screen.dart';

class AuthController extends GetxController {
  RxBool loading = true.obs;
  @override
  void onInit() {
    onCheckUser();
    super.onInit();
  }

  Future singUpAuth(AuthModel authModel) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      );
      if (credential.user != null) {
        Get.snackbar('Success', 'Account create success',
            colorText: Colors.white);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Invalid', 'Something wrong');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Invalid', 'Something wrong');
      } else {
        Get.snackbar('Invalid', 'Something wrong');
      }
    } catch (e) {
      print(e);
    }
    update();
  }

  Future singInAuth(AuthModel authModel) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      );
      if (credential.user != null) {
        Get.offAll(HomeScreen());
        Get.snackbar('Success', 'Account login success',
            colorText: Colors.white);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Invalid', 'Something wrong');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Invalid', 'Something wrong');
      } else {
        Get.snackbar('Invalid', 'Something wrong');
      }
    }
    update();
  }

  Future onCheckUser() async {
    await Future.delayed(const Duration(seconds: 3));
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          Get.offAll(LoginScreen());
        } else {
          Get.offAll(HomeScreen());
        }
      },
    );
  }

  Future singOutAuth() async {
    await FirebaseAuth.instance.signOut();
  }
}
