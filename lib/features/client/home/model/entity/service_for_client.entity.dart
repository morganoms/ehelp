// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ehelp/features/client/booking/models/entity/booked_info/booked_info.entity.dart';
import 'package:ehelp/features/client/home/model/entity/feedback.entity.dart';
import 'package:ehelp/features/client/home/model/entity/provider_user.entity.dart';

import '../../../../../core/dto_validations.dart';

class ServiceForClientEntity {
  final int userId;
  final double rating;
  final int countryId;
  final String name;
  final String photoUrl;
  final String descriptionPortuguese;
  final String descriptionSpanish;
  final String descriptionEnglish;
  final int minValue;
  final int servicesDoneAmount;
  final BookedInfoEntity? bookedInfo;
  final List<FeedbackEntity> feedback;

  ServiceForClientEntity(
      {required this.userId,
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
      this.bookedInfo});
}

extension ServiceForClientDto on ServiceForClientEntity {
  static ServiceForClientEntity fromJson(final Map<String, dynamic> json) {
    final ProviderUser _userProvider =
        DtoValidation.dynamicToObject(json['user'], ProviderUserDto.fromJson);

    return ServiceForClientEntity(
      userId: _userProvider.userId,
      rating: _userProvider.rating,
      countryId: _userProvider.countryId,
      name: _userProvider.name,
      photoUrl: _userProvider.photoUrl,
      descriptionPortuguese:
          _userProvider.userSpecialty[0].descriptionPortuguese,
      descriptionSpanish: _userProvider.userSpecialty[0].descriptionSpanish,
      descriptionEnglish: _userProvider.userSpecialty[0].descriptionEnglish,
      minValue: _userProvider.userSpecialty[0].minValue,
      servicesDoneAmount: _userProvider.servicesDoneAmount,
      feedback: DtoValidation.dynamicToListObject(
          json['ranting'], FeedbackDto.fromJson),
    );
  }
}
