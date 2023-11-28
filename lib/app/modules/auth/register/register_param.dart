import '../../../account_type.dart';

class RegisterParam {
  final String name;
  final String phone;
  final String cpf;
  final DateTime birthAt;

  final String street;
  final String neighborhood;
  final String cep;
  final String number;
  final String city;
  final String state;

  final String email;
  final String password;
  
  final AccountType account;

  RegisterParam({
    required this.name,
    required this.phone,
    required this.cpf,
    required this.birthAt,
    required this.email,
    required this.password,
    required this.street,
    required this.neighborhood,
    required this.cep,
    required this.number,
    required this.city,
    required this.state,
    required this.account,
  });
}
