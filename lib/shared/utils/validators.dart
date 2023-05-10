class Validators {
  Validators._();
  static String? validateEmail(final String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório!';
    } else if (!value.contains('@')) {
      return 'Informe um email válido';
    }

    return null;
  }

  static String? emptyValidate(final String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório!';
    }
    return null;
  }
}
