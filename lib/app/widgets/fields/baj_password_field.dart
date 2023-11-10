import 'package:flutter/material.dart';

import 'baj_text_field.dart';

class BajPasswordField extends StatefulWidget {
  const BajPasswordField({
    super.key,
    required this.label,
    required this.controller,
  });

  final TextEditingController controller;
  final String label;

  @override
  State<BajPasswordField> createState() => _BajPasswordFieldState();
}

class _BajPasswordFieldState extends State<BajPasswordField> {
  bool obscureText = true;

  void toggleObscure() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BajTextField(
      controller: widget.controller,
      label: widget.label,
      suffix: IconButton(
        onPressed: toggleObscure,
        icon: const Icon(Icons.calendar_month_outlined),
      ),
    );
  }
}
