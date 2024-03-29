import 'package:demo_firebase11_12/auth/controller/auth_controller.dart';
import 'package:demo_firebase11_12/auth/model/auth_model.dart';
import 'package:demo_firebase11_12/auth/widget/button.dart';
import 'package:demo_firebase11_12/auth/widget/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cfPasswordController = TextEditingController();
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 82, 88, 98),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Create\nAccount',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                InputField(
                  controller: emailController,
                  label: 'Email',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  controller: passwordController,
                  label: 'Password',
                  obscureText: false,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility_off,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  controller: cfPasswordController,
                  label: 'Confirm Password',
                  obscureText: false,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility_off,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () async {
                    if (passwordController.text == cfPasswordController.text) {
                      await authController.singUpAuth(
                        AuthModel(
                          email: emailController.text,
                          password: passwordController.text.trim(),
                        ),
                      );
                    } else {
                      print('error');
                    }
                  },
                  child: const ButtonWidget(
                    text: 'SING UP',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
