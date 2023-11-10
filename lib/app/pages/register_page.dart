import 'package:flutter/material.dart';

import '../services/local_storage/i_local_storage.dart';
import '../whatever.dart';
import '../widgets/fields/baj_date_field.dart';
import '../widgets/fields/baj_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    required this.localStorage,
  });

  final ILocalStorage localStorage;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final streetController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final zipCodeController = TextEditingController();
  final numberController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  int accountTypeCode = AccountType.values.first.code;

  void changeAccountType(int? newValue) {
    if (newValue == null || newValue == accountTypeCode) return;

    setState(() {
      accountTypeCode = newValue;
    });
  }

  void register() async {
    final personID = await widget.localStorage.save('persons', {
      'name': nameController.text,
      'cpf': cpfController.text,
      'phone': phoneController.text,
      'birth_at': '',
      'address': {
        'street': streetController.text,
        'neighborhood': neighborhoodController.text,
        'number': numberController.text,
        'zip_code': zipCodeController.text,
        'city': cityController.text,
        'state': stateController.text,
      }
    });

    widget.localStorage.save('users', {
      'email': emailController.text,
      'password': passwordController.text,
      'person_id': personID,
    });

    widget.localStorage.save('accounts', {
      'account_type': accountTypeCode,
      'number': '',
      'person_id': personID,
    });

    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final sixteenYearsAgo = now.subtract(const Duration(days: 5840));
    final oneHundredThirtyYearsAgo = now.subtract(const Duration(days: 47450));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            BajTextField(
              controller: nameController,
              label: 'Nome',
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
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            BajTextField(
              controller: emailController,
              label: 'Email',
            ),
            BajTextField(
              controller: passwordController,
              label: 'Senha',
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            BajTextField(
              controller: streetController,
              label: 'Rua',
            ),
            BajTextField(
              controller: neighborhoodController,
              label: 'Bairro',
            ),
            Row(
              children: [
                Expanded(
                  child: BajTextField(
                    controller: zipCodeController,
                    label: 'CEP',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: BajTextField(
                    controller: numberController,
                    label: 'Número',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: BajTextField(
                    controller: cityController,
                    label: 'Cidade',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: BajTextField(
                    controller: stateController,
                    label: 'Estado',
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            DropdownButton<int>(
              value: accountTypeCode,
              onChanged: changeAccountType,
              items: AccountType.values.map((e) {
                return DropdownMenuItem(
                  value: e.code,
                  child: Text(e.name),
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            ElevatedButton(
              onPressed: register,
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
