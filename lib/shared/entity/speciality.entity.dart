import 'package:ehelp/features/client/home/model/entity/feedback.entity.dart';

import '../../core/dto_validations.dart';

class SpecialityEntity {
  SpecialityEntity({
    required this.id,
    required this.descriptionPortuguese,
    required this.descriptionSpanish,
    required this.descriptionEnglish,
    required this.imageUrl,
    required this.feedback,
  });

  final int id;
  final String descriptionPortuguese;
  final String descriptionSpanish;
  final String descriptionEnglish;
  final String imageUrl;
  final List<FeedbackEntity> feedback;

  @override
  String toString() {
    return 'SpecialityEntity(id: $id, descriptionPortuguese: $descriptionPortuguese, descriptionSpanish: $descriptionSpanish, descriptionEnglish: $descriptionEnglish, imageUrl: $imageUrl, feedback: $feedback)';
  }
}

extension SpecialityDto on SpecialityEntity {
  static SpecialityEntity fromJson(final Map<String, dynamic> json) {
    return SpecialityEntity(
      descriptionEnglish:
          DtoValidation.dynamicToString(json['descriptionEnglish']),
      descriptionPortuguese:
          DtoValidation.dynamicToString(json['descriptionPortuguese']),
      descriptionSpanish:
          DtoValidation.dynamicToString(json['descriptionSpanish']),
      id: DtoValidation.dynamicToInt(json['id']),
      imageUrl: DtoValidation.dynamicToString(json['photoUrl']),
      feedback: DtoValidation.dynamicToListObject(
          json['ranting'], FeedbackDto.fromJson),
    );
  }
}
