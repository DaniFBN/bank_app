enum AccountType {
  current(1),
  saving(2),
  salary(3),
  investment(4);

  const AccountType(this.code);
  final int code;

  static AccountType fromCode(int code) {
    return AccountType.values.firstWhere((e) => e.code == code);
  }
}
