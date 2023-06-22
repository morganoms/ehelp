import 'package:ehelp/features/client/home/model/entity/service_for_client/service_for_client.entity.dart';

import '../../../../../../core/dto_validations.dart';
import '../feedback/feedback.dto.dart';

extension ServiceForClientDto on ServiceForClientEntity {
  static ServiceForClientEntity fromJson(final Map<String, dynamic> json) {
    return ServiceForClientEntity(
      userId: DtoValidation.dynamicToInt(json['userId']),
      rating: DtoValidation.dynamicToDouble(json['rating']),
      countryId: DtoValidation.dynamicToInt(json['countryId']),
      name: DtoValidation.dynamicToString(json['name']),
      photoUrl: DtoValidation.dynamicToString(json['photoUrl']),
      descriptionPortuguese:
          DtoValidation.dynamicToString(json['descriptionPortuguese']),
      descriptionSpanish:
          DtoValidation.dynamicToString(json['descriptionSpanish']),
      descriptionEnglish:
          DtoValidation.dynamicToString(json['descriptionEnglish']),
      minValue: DtoValidation.dynamicToDouble(json['minValue']),
      servicesDoneAmount:
          DtoValidation.dynamicToInt(json['servicesDoneAmount']),
      feedback: DtoValidation.dynamicToListObject(
          json['feedback'], FeedbackDto.fromJson),
    );
  }
}
