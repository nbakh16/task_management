import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label, hint;
  final int maxLine;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.label,
      required this.hint,
      this.maxLine = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxLine,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8.0),
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.white
        ),
        validator: (validate) {
          if(validate!.isEmpty) {
            return 'Field cannot be empty';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
