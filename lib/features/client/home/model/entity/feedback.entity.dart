import '../../../../../core/dto_validations.dart';

class FeedbackEntity {
  FeedbackEntity(
      {required this.id, required this.menssage, required this.stars});
  final int id;
  final String menssage;
  final double stars;
}

extension FeedbackDto on FeedbackEntity {
  static FeedbackEntity fromJson(final Map<String, dynamic> json) {
    return FeedbackEntity(
      id: DtoValidation.dynamicToInt(json['id']),
      menssage: DtoValidation.dynamicToString(json['menssage']),
      stars: DtoValidation.dynamicToDouble(json['stars']),
    );
  }
}
