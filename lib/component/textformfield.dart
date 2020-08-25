import 'package:flutter/material.dart';

class EGTextFormField extends StatelessWidget {
  EGTextFormField({@required this.hintText, this.controller,this.labelText,this.obscureText = false});
  // Variables
  final String hintText;
  final String labelText;
  final obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
      ),
      obscureText: obscureText,
    );
  }
}