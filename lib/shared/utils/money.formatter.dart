import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

mixin Money {
  static dynamic format(final amount) {
    if (amount == null) {
      return '';
    } else {
      try {
        final NumberFormat currencyFormatter =
            NumberFormat(r'R$ #,##0.00', 'pt_BR');
        return currencyFormatter.format(amount);
      } catch (e) {
        debugPrint('Ocorreu um erro ao tentar converter o valor $e');
        return amount;
      }
    }
  }

  static dynamic formatToDouble(final String? amount) {
    if (amount == null) {
      return '';
    }
    try {
      final double value =
          NumberFormat().parse(amount.replaceAll(r'R$ ', '')) / 100;
      return value;
    } catch (e) {
      debugPrint('Ocorreu um erro ao tentar converter o valor $e');
      return amount;
    }
  }
}
