import 'package:intl/intl.dart';

// ignore: avoid_classes_with_only_static_members
class CustomDate {
  static String format(final DateTime? date) =>
      date != null ? DateFormat('dd/MM/yyyy').format(date) : '';

  static DateTime? parse(final String? date) =>
      date != null ? DateFormat.yMd('pt_BR').parse(date) : null;

  static String formatToDay(final DateTime? date) =>
      date != null ? DateFormat.d('pt_BR').format(date) : '';

  static String formatToDayMonth(final DateTime? date) =>
      date != null ? DateFormat.Md('pt_BR').format(date) : '';

  static String? timeFormat(final int? time) =>
      time != null ? '$time:00' : null;
}
