import 'package:ehelp/features/client/home/model/entity/feedback/feedback.entity.dart';

import '../../../../../../core/dto_validations.dart';

extension FeedbackDto on FeedbackEntity {
  static FeedbackEntity fromJson(final Map<String, dynamic> json) {
    return FeedbackEntity(
      id: DtoValidation.dynamicToInt(json['id']),
      menssage: DtoValidation.dynamicToString(json['menssage']),
    );
  }
}
