import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {

  final String text;

  const CustomText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(text,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal
        ),
      ),
    );
  }
}