// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ehelp/shared/entity/feedback.entity.dart';

import '../../core/dto_validations.dart';
import 'booked_info.entity.dart';

class ProfessionalForClientEntity {
  final int userId;
  final int rating;
  final int countryId;
  final String name;
  final String photoUrl;
  final String descriptionPortuguese;
  final String descriptionSpanish;
  final String descriptionEnglish;
  final double minValue;
  final BookedInfo? bookedInfo;
  final int servicesDoneAmount;
  final FeedbackEntity feedback;

  ProfessionalForClientEntity({
    required this.userId,
    required this.rating,
    required this.countryId,
    required this.name,
    required this.photoUrl,
    required this.descriptionPortuguese,
    required this.descriptionSpanish,
    required this.descriptionEnglish,
    required this.minValue,
    this.bookedInfo,
    required this.servicesDoneAmount,
    required this.feedback,
  });

  ProfessionalForClientEntity copyWith({
    int? userId,
    int? rating,
    int? countryId,
    String? name,
    String? photoUrl,
    String? descriptionPortuguese,
    String? descriptionSpanish,
    String? descriptionEnglish,
    double? minValue,
    BookedInfo? bookedInfo,
    int? servicesDoneAmount,
    FeedbackEntity? feedback,
  }) {
    return ProfessionalForClientEntity(
      userId: userId ?? this.userId,
      rating: rating ?? this.rating,
      countryId: countryId ?? this.countryId,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      descriptionPortuguese:
          descriptionPortuguese ?? this.descriptionPortuguese,
      descriptionSpanish: descriptionSpanish ?? this.descriptionSpanish,
      descriptionEnglish: descriptionEnglish ?? this.descriptionEnglish,
      minValue: minValue ?? this.minValue,
      bookedInfo: bookedInfo ?? this.bookedInfo,
      servicesDoneAmount: servicesDoneAmount ?? this.servicesDoneAmount,
      feedback: feedback ?? this.feedback,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'rating': rating,
      'countryId': countryId,
      'name': name,
      'photoUrl': photoUrl,
      'descriptionPortuguese': descriptionPortuguese,
      'descriptionSpanish': descriptionSpanish,
      'descriptionEnglish': descriptionEnglish,
      'minValue': minValue,
      'bookedInfo': bookedInfo?.toMap(),
      'servicesDoneAmount': servicesDoneAmount,
      'feedback': feedback.toMap(),
    };
  }

  factory ProfessionalForClientEntity.fromMap(Map<String, dynamic> map) {
    return ProfessionalForClientEntity(
      userId: DtoValidation.dynamicToInt(map['userId']),
      rating: DtoValidation.dynamicToInt(map['rating']),
      countryId: DtoValidation.dynamicToInt(map['countryId']),
      name: DtoValidation.dynamicToString(map['name']),
      bookedInfo:
          DtoValidation.dynamicToObject(map['bookedInfo'], BookedInfo.fromMap),
      photoUrl: DtoValidation.dynamicToString(map['photoUrl']),
      descriptionPortuguese:
          DtoValidation.dynamicToString(map['descriptionPortuguese']),
      descriptionSpanish:
          DtoValidation.dynamicToString(map['descriptionSpanish']),
      descriptionEnglish:
          DtoValidation.dynamicToString(map['descriptionEnglish']),
      minValue: DtoValidation.dynamicToDouble(map['minValue']),
      servicesDoneAmount: DtoValidation.dynamicToInt(map['servicesDoneAmount']),
      feedback: DtoValidation.dynamicToObject(
          map['feedback'], FeedbackEntity.fromMap),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfessionalForClientEntity.fromJson(String source) =>
      ProfessionalForClientEntity.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfessionalForClientEntity(userId: $userId, rating: $rating, countryId: $countryId, name: $name, photoUrl: $photoUrl, descriptionPortuguese: $descriptionPortuguese, descriptionSpanish: $descriptionSpanish, descriptionEnglish: $descriptionEnglish, minValue: $minValue, bookedInfo: $bookedInfo, servicesDoneAmount: $servicesDoneAmount, feedback: $feedback)';
  }

  @override
  bool operator ==(covariant ProfessionalForClientEntity other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.rating == rating &&
        other.countryId == countryId &&
        other.name == name &&
        other.photoUrl == photoUrl &&
        other.descriptionPortuguese == descriptionPortuguese &&
        other.descriptionSpanish == descriptionSpanish &&
        other.descriptionEnglish == descriptionEnglish &&
        other.minValue == minValue &&
        other.bookedInfo == bookedInfo &&
        other.servicesDoneAmount == servicesDoneAmount &&
        other.feedback == feedback;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        rating.hashCode ^
        countryId.hashCode ^
        name.hashCode ^
        photoUrl.hashCode ^
        descriptionPortuguese.hashCode ^
        descriptionSpanish.hashCode ^
        descriptionEnglish.hashCode ^
        minValue.hashCode ^
        bookedInfo.hashCode ^
        servicesDoneAmount.hashCode ^
        feedback.hashCode;
  }
}
