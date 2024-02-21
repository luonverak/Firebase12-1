import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
    super.key,
    required this.controller,
    required this.label,
    this.suffixIcon,
    this.obscureText,
  });
  var controller = TextEditingController();
  var label;
  IconButton? suffixIcon;
  bool? obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText!,
    );
  }
}
