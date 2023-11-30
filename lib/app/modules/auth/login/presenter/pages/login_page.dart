import 'package:flutter/material.dart';

import '../../../../../widgets/fields/baj_text_field.dart';
import '../../domain/params/login_param.dart';
import '../stores/login_store.dart';
import '../stores/states/login_state.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
    required this.loginStore,
  });

  final LoginStore loginStore;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final param = LoginParam(
      email: emailController.text,
      password: passwordController.text,
    );

    await widget.loginStore.login(param);
  }

  void loginListener() {
    final state = widget.loginStore.state;
    switch (state) {
      case FailureLoginState():
        final messenger = ScaffoldMessenger.of(context);
        final snackbar = SnackBar(content: Text(state.message));
        messenger.showSnackBar(snackbar);
      case LoggedLoginState():
        Navigator.of(context).pushReplacementNamed('/');
      case InitialLoginState():
      case LoadingLoginState():
        return;
    }
  }

  @override
  void initState() {
    super.initState();

    widget.loginStore.addListener(loginListener);
  }

  @override
  void dispose() {
    widget.loginStore.removeListener(loginListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            BajTextField(
              controller: emailController,
              label: 'Email',
            ),
            const SizedBox(height: 12),
            BajTextField(
              controller: passwordController,
              label: 'Senha',
              borderColor: Colors.pink,
              validator: (_) => 'Email inválido',
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              child: const Text('Cadastrar'),
            ),
            AnimatedBuilder(
              animation: widget.loginStore,
              child: ElevatedButton(
                onPressed: login,
                child: const Text('Login'),
              ),
              builder: (_, child) {
                switch (widget.loginStore.state) {
                  case LoadingLoginState():
                    return const CircularProgressIndicator.adaptive();
                  case FailureLoginState():
                  case InitialLoginState():
                  case LoggedLoginState():
                    return child!;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
