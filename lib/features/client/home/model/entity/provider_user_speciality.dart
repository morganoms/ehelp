import '../../../../../core/dto_validations.dart';

class ProviderUserSpeciality {
  ProviderUserSpeciality({
    required this.minValue,
    required this.descriptionPortuguese,
    required this.descriptionEnglish,
    required this.descriptionSpanish,
    required this.specialtyId,
  });

  final int minValue;
  final int specialtyId;
  final String descriptionPortuguese;
  final String descriptionEnglish;
  final String descriptionSpanish;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'minValue': minValue,
      'descriptionPortuguese': descriptionPortuguese,
      'descriptionEnglish': descriptionEnglish,
      'descriptionSpanish': descriptionSpanish,
    };
  }

  @override
  String toString() {
    return 'ProviderUserSpeciality(minValue: $minValue, descriptionPortuguese: $descriptionPortuguese, descriptionEnglish: $descriptionEnglish, descriptionSpanish: $descriptionSpanish)';
  }
}

extension ProviderUserSpecialityDto on ProviderUserSpeciality {
  static ProviderUserSpeciality fromJson(final Map<String, dynamic> json) {
    return ProviderUserSpeciality(
      descriptionPortuguese: DtoValidation.dynamicToString(
          json['specialty']['descriptionPortuguese']),
      descriptionSpanish: DtoValidation.dynamicToString(
          json['specialty']['descriptionSpanish']),
      descriptionEnglish: DtoValidation.dynamicToString(
          json['specialty']['descriptionEnglish']),
      minValue: DtoValidation.dynamicToInt(json['minValue']),
      specialtyId: DtoValidation.dynamicToInt(json['specialtyId']),
    );
  }
}
