import 'package:flutter/material.dart';

import '../../../../account_type.dart';
import '../../../../widgets/fields/baj_text_field.dart';
import '../register_param.dart';
import '../stores/register_state.dart';
import '../stores/register_store.dart';
import 'components/person_component.dart';

class RegisterPage extends StatefulWidget {
  final RegisterStore registerStore;

  const RegisterPage({
    super.key,
    required this.registerStore,
  });

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
  DateTime? birthAtDate;

  void changeAccountType(int? newValue) {
    if (newValue == null || newValue == accountTypeCode) return;

    setState(() {
      accountTypeCode = newValue;
    });
  }

  void changeBirthAt(DateTime date) {
    if (date == birthAtDate) return;

    setState(() {
      birthAtDate = date;
    });
  }

  void register() async {
    final param = RegisterParam(
      name: nameController.text,
      phone: phoneController.text,
      cpf: cpfController.text,
      birthAt: DateTime.now(),
      email: emailController.text,
      password: passwordController.text,
      street: streetController.text,
      neighborhood: neighborhoodController.text,
      cep: zipCodeController.text,
      number: numberController.text,
      city: cityController.text,
      state: stateController.text,
      account: AccountType.fromCode(accountTypeCode),
    );

    widget.registerStore.register(param);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
              child: ExpansionTile(
                title: const Text('Person Form'),
                children: [
                  PersonComponent(
                    onClose: () => false,
                  ),
                ],
              ),
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
            AnimatedBuilder(
                animation: widget.registerStore,
                child: ElevatedButton(
                  onPressed: register,
                  child: const Text('Cadastrar'),
                ),
                builder: (_, child) {
                  if (widget.registerStore.state is LoadingRegisterState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return child!;
                }),
          ],
        ),
      ),
    );
  }
}
