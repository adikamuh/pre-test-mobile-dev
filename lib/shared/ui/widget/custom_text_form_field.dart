import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final bool isObsecureText;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.label,
    this.isObsecureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      obscureText: isObsecureText,
      validator: validator,
    );
  }
}
