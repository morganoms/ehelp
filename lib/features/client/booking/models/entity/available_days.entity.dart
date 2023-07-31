import '../../../../../core/dto_validations.dart';

class AvailableDaysEntity {
  AvailableDaysEntity({
    required this.id,
    required this.userId,
    required this.userName,
    required this.dayOfWeekId,
    required this.descriptionPortuguese,
    required this.descriptionSpanish,
    required this.descriptionEnglish,
    required this.timeStart,
    required this.timeEnd,
  });

  final int id;
  final int userId;
  final String userName;
  final int dayOfWeekId;
  final String descriptionPortuguese;
  final String descriptionSpanish;
  final String descriptionEnglish;
  final String timeStart;
  final String timeEnd;

  AvailableDaysEntity copyWith({
    int? id,
    int? userId,
    String? userName,
    int? dayOfWeekId,
    String? descriptionPortuguese,
    String? descriptionSpanish,
    String? descriptionEnglish,
    String? timeStart,
    String? timeEnd,
  }) {
    return AvailableDaysEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      dayOfWeekId: dayOfWeekId ?? this.dayOfWeekId,
      descriptionPortuguese:
          descriptionPortuguese ?? this.descriptionPortuguese,
      descriptionSpanish: descriptionSpanish ?? this.descriptionSpanish,
      descriptionEnglish: descriptionEnglish ?? this.descriptionEnglish,
      timeStart: timeStart ?? this.timeStart,
      timeEnd: timeEnd ?? this.timeEnd,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'userName': userName,
      'dayOfWeekId': dayOfWeekId,
      'descriptionPortuguese': descriptionPortuguese,
      'descriptionSpanish': descriptionSpanish,
      'descriptionEnglish': descriptionEnglish,
      'timeStart': timeStart,
      'timeEnd': timeEnd,
    };
  }

  @override
  String toString() {
    return 'AvailableDaysEntity(id: $id, userId: $userId, userName: $userName, dayOfWeekId: $dayOfWeekId, descriptionPortuguese: $descriptionPortuguese, descriptionSpanish: $descriptionSpanish, descriptionEnglish: $descriptionEnglish, timeStart: $timeStart, timeEnd: $timeEnd)';
  }
}

extension AvailableDaysDto on AvailableDaysEntity {
  static AvailableDaysEntity fromJson(Map<String, dynamic> json) {
    return AvailableDaysEntity(
      id: DtoValidation.dynamicToInt(json['id']),
      userId: DtoValidation.dynamicToInt(json['userId']),
      userName: DtoValidation.dynamicToString(json['userName']),
      dayOfWeekId: DtoValidation.dynamicToInt(json['dayOfWeekId']),
      descriptionPortuguese:
          DtoValidation.dynamicToString(json['descriptionPortuguese']),
      descriptionSpanish:
          DtoValidation.dynamicToString(json['descriptionSpanish']),
      descriptionEnglish:
          DtoValidation.dynamicToString(json['descriptionEnglish']),
      timeStart: DtoValidation.dynamicToString(json['timeStart']),
      timeEnd: DtoValidation.dynamicToString(json['timeEnd']),
    );
  }
}
