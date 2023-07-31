// ignore_for_file: unnecessary_lambdas

class DtoValidation {
  DtoValidation._();

  static double dynamicToDouble(final dynamic field) =>
      field != null && field.toString() != ''
          ? double.parse(field.toString())
          : 0;

  static int dynamicToInt(final dynamic field) =>
      field != null && field.toString() != ''
          ? int.tryParse(field.toString()) ?? 0
          : 0;

  static String dynamicToString(final dynamic field) =>
      field != null && field != '' ? field.toString() : '';

  static DateTime dynamicToDateTime(final dynamic field) =>
      field != null && field != ''
          ? DateTime.parse(field.toString())
          : DateTime.now();

  static T dynamicToObject<T>(final dynamic field,
          final T Function(Map<String, dynamic> json) fromJson) =>
      fromJson(field);

  static List<T> dynamicToListObject<T>(
    final dynamic field,
    final T Function(Map<String, dynamic> json) fromJson,
  ) =>
      field != null && field != ''
          ? (field as List<dynamic>)
              .map((final dynamic e) => fromJson(e as Map<String, dynamic>))
              .toList()
          : <T>[];

  static List<String> dynamicToListString(final dynamic field) =>
      field != null && field != ''
          ? (field as List<dynamic>)
              .map((final dynamic e) => e.toString())
              .toList()
          : <String>[];

  static List<int> dynamicToListInt(final dynamic field) =>
      field != null && field != ''
          ? (field as List<dynamic>).map((final dynamic e) => e as int).toList()
          : <int>[];
}
