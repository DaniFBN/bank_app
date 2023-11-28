import 'package:flutter/material.dart';

import '../../../../../widgets/fields/baj_date_field.dart';
import '../../../../../widgets/fields/baj_text_field.dart';

class PersonComponent extends StatefulWidget {
  const PersonComponent({
    super.key,
    required this.onClose,
  });

  final bool Function() onClose;

  @override
  State<PersonComponent> createState() => _PersonComponentState();
}

class _PersonComponentState extends State<PersonComponent> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final cpfController = TextEditingController();
  DateTime? birthAtDate;

  void changeBirthAt(DateTime date) {
    if (date == birthAtDate) return;

    setState(() {
      birthAtDate = date;
    });
  }

  String? validateName(String value) {
    final regex = RegExp(r'^[A-Z][a-z]+( [a-zA-Z]+){1,}$');

    final isValid = regex.hasMatch(value);
    if (!isValid) return 'Digite o nome completo';
    return null;
  }

  void validate() {
    final formIsValid = formKey.currentState!.validate();
    if (!formIsValid) return;

    print('VALID');
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final sixteenYearsAgo = now.subtract(const Duration(days: 5840));
    final oneHundredThirtyYearsAgo = now.subtract(const Duration(days: 47450));

    return Form(
      key: formKey,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BajTextField(
                label: 'Nome',
                controller: nameController,
                validator: validateName,
                isRequired: true,
              ),
              BajTextField(
                controller: phoneController,
                label: 'Telefone',
              ),
              BajTextField(
                controller: cpfController,
                label: 'CPF',
              ),
              BajDateField(
                label: 'Data de nascimento',
                initialDate: sixteenYearsAgo,
                firstDate: oneHundredThirtyYearsAgo,
                lastDate: now,
                onChanged: changeBirthAt,
              ),
              ElevatedButton(
                onPressed: validate,
                child: const Text('Próximo Passo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
