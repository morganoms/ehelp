// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ehelp/shared/entity/feedback.entity.dart';

import '../../core/dto_validations.dart';

class SpecialityEntity {
  final int id;
  final String descriptionPortuguese;
  final String descriptionSpanish;
  final String descriptionEnglish;
  final String imageUrl;
  final FeedbackEntity feedback;
  SpecialityEntity({
    required this.id,
    required this.descriptionPortuguese,
    required this.descriptionSpanish,
    required this.descriptionEnglish,
    required this.imageUrl,
    required this.feedback,
  });

  SpecialityEntity copyWith({
    int? id,
    String? descriptionPortuguese,
    String? descriptionSpanish,
    String? descriptionEnglish,
    String? imageUrl,
    FeedbackEntity? feedback,
  }) {
    return SpecialityEntity(
      id: id ?? this.id,
      descriptionPortuguese:
          descriptionPortuguese ?? this.descriptionPortuguese,
      descriptionSpanish: descriptionSpanish ?? this.descriptionSpanish,
      descriptionEnglish: descriptionEnglish ?? this.descriptionEnglish,
      imageUrl: imageUrl ?? this.imageUrl,
      feedback: feedback ?? this.feedback,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'descriptionPortuguese': descriptionPortuguese,
      'descriptionSpanish': descriptionSpanish,
      'descriptionEnglish': descriptionEnglish,
      'imageUrl': imageUrl,
      'feedback': feedback.toMap(),
    };
  }

  factory SpecialityEntity.fromMap(Map<String, dynamic> map) {
    return SpecialityEntity(
      id: DtoValidation.dynamicToInt(map['id']),
      descriptionPortuguese:
          DtoValidation.dynamicToString(map['descriptionPortuguese']),
      descriptionSpanish:
          DtoValidation.dynamicToString(map['descriptionSpanish']),
      descriptionEnglish:
          DtoValidation.dynamicToString(map['descriptionEnglish']),
      imageUrl: DtoValidation.dynamicToString(map['imageUrl']),
      feedback: DtoValidation.dynamicToObject(
          map['feedback'], FeedbackEntity.fromMap),
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialityEntity.fromJson(String source) =>
      SpecialityEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SpecialityEntity(id: $id, descriptionPortuguese: $descriptionPortuguese, descriptionSpanish: $descriptionSpanish, descriptionEnglish: $descriptionEnglish, imageUrl: $imageUrl, feedback: $feedback)';
  }

  @override
  bool operator ==(covariant SpecialityEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.descriptionPortuguese == descriptionPortuguese &&
        other.descriptionSpanish == descriptionSpanish &&
        other.descriptionEnglish == descriptionEnglish &&
        other.imageUrl == imageUrl &&
        other.feedback == feedback;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        descriptionPortuguese.hashCode ^
        descriptionSpanish.hashCode ^
        descriptionEnglish.hashCode ^
        imageUrl.hashCode ^
        feedback.hashCode;
  }
}
