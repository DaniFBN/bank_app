import 'package:flutter/material.dart';

import 'baj_text_field.dart';

class BajDateField extends StatefulWidget {
  const BajDateField({
    super.key,
    required this.label,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onChanged,
  });

  final String label;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final void Function(DateTime) onChanged;

  @override
  State<BajDateField> createState() => _BajDateFieldState();
}

class _BajDateFieldState extends State<BajDateField> {
  final controller = TextEditingController();

  void selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: widget.initialDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );

    if (date == null) return;
    controller.text = date.toString();

    widget.onChanged(date);
  }

  @override
  Widget build(BuildContext context) {
    return BajTextField(
      controller: controller,
      label: widget.label,
      suffix: IconButton(
        onPressed: selectDate,
        icon: const Icon(Icons.calendar_month_outlined),
      ),
    );
  }
}
