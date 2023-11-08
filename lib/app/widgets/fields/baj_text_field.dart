import 'package:flutter/material.dart';

class BajTextField extends StatelessWidget {
  const BajTextField({
    super.key,
    required this.controller,
    required this.label,
    this.suffix,
  });

  final TextEditingController controller;
  final String label;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        suffix: suffix,
      ),
    );
  }
}
