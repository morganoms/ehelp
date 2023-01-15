enum BankAccountType { contaSalario, contaCorrente, contaPoupanca }

extension BankAccountTypeToString on BankAccountType {
  String? convertToString() {
    switch (this) {
      case BankAccountType.contaCorrente:
        return 'Conta corrente';
      case BankAccountType.contaPoupanca:
        return 'Conta poupança';
      case BankAccountType.contaSalario:
        return 'Conta Salário';
      default:
        return null;
    }
  }
}
