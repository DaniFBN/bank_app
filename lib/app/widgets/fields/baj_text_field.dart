import 'package:flutter/material.dart';

class BajTextField extends StatefulWidget {
  const BajTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isRequired = false,
    this.validator,
    this.suffix,
    this.prefixIcon,
    this.borderColor,
  });

  final TextEditingController controller;
  final String label;
  final bool isRequired;
  final String? Function(String value)? validator;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Color? borderColor;

  @override
  State<BajTextField> createState() => _BajTextFieldState();
}

class _BajTextFieldState extends State<BajTextField> {
  String? validator(String? value) {
    if (widget.isRequired && (value == null || value.isEmpty)) {
      return 'Campo obrigatório';
    }

    if (widget.validator != null && value != null) {
      return widget.validator!(value);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final defaultBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(color: widget.borderColor ?? theme.primaryColor),
    );

    return TextFormField(
      controller: widget.controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: widget.label,
        suffix: widget.suffix,
        prefixIcon: widget.prefixIcon,
        enabledBorder: defaultBorder,
        border: defaultBorder,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(
            color: widget.borderColor ?? theme.primaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
