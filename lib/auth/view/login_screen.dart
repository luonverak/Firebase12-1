import 'package:demo_firebase11_12/auth/view/sign_up_screen.dart';
import 'package:demo_firebase11_12/auth/widget/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool check = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 82, 88, 98),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              InputField(
                controller: emailController,
                label: 'Email',
                obscureText: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => InputField(
                  controller: passwordController,
                  label: 'Password',
                  obscureText: check.value,
                  suffixIcon: IconButton(
                    onPressed: () {
                      check.value = !check.value;
                    },
                    icon: Icon(
                      check.value == true
                          ? Icons.visibility_off
                          : Icons.remove_red_eye,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              const ButtonWidget(
                text: 'SING IN',
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'OR',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset('asset/icon/google.png'),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CupertinoButton(
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'SIGN UP',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        onPressed: () => Get.to(SignUpScreen()),
      ),
    );
  }
}
