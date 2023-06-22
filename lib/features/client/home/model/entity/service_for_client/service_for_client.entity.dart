// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ehelp/features/client/home/model/entity/feedback/feedback.entity.dart';

class ServiceForClientEntity {
  final int userId;
  final double rating;
  final int countryId;
  final String name;
  final String photoUrl;
  final String descriptionPortuguese;
  final String descriptionSpanish;
  final String descriptionEnglish;
  final double minValue;
  final int servicesDoneAmount;
  final List<FeedbackEntity> feedback;

  ServiceForClientEntity({
    required this.userId,
    required this.rating,
    required this.countryId,
    required this.name,
    required this.photoUrl,
    required this.descriptionPortuguese,
    required this.descriptionSpanish,
    required this.descriptionEnglish,
    required this.minValue,
    required this.servicesDoneAmount,
    required this.feedback,
  });

  ServiceForClientEntity copyWith({
    int? userId,
    double? rating,
    int? countryId,
    String? name,
    String? photoUrl,
    String? descriptionPortuguese,
    String? descriptionSpanish,
    String? descriptionEnglish,
    double? minValue,
    int? servicesDoneAmount,
    List<FeedbackEntity>? feedback,
  }) {
    return ServiceForClientEntity(
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
      servicesDoneAmount: servicesDoneAmount ?? this.servicesDoneAmount,
      feedback: feedback ?? this.feedback,
    );
  }

  @override
  String toString() {
    return 'ServiceForClientEntity(userId: $userId, rating: $rating, countryId: $countryId, name: $name, photoUrl: $photoUrl, descriptionPortuguese: $descriptionPortuguese, descriptionSpanish: $descriptionSpanish, descriptionEnglish: $descriptionEnglish, minValue: $minValue, servicesDoneAmount: $servicesDoneAmount, feedback: $feedback)';
  }
}
