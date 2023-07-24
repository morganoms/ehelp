import 'package:ehelp/features/client/home/model/entity/provider_user_speciality.dart';

import '../../../../../core/dto_validations.dart';

class ProviderUser {
  ProviderUser({
    required this.userId,
    required this.countryId,
    required this.name,
    required this.photoUrl,
    required this.servicesDoneAmount,
    required this.rating,
    required this.userSpecialty,
  });

  final int userId;
  final int countryId;
  final String name;
  final String photoUrl;
  final int servicesDoneAmount;
  final double rating;
  final List<ProviderUserSpeciality> userSpecialty;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'countryId': countryId,
      'name': name,
      'photoUrl': photoUrl,
      'servicesDoneAmount': servicesDoneAmount,
      'rating': rating,
      'userSpecialty': userSpecialty.map((x) => x.toMap()).toList(),
    };
  }

  @override
  String toString() {
    return 'ProviderUser(userId: $userId, countryId: $countryId, name: $name, photoUrl: $photoUrl, servicesDoneAmount: $servicesDoneAmount, rating: $rating, userSpecialty: $userSpecialty)';
  }
}

extension ProviderUserDto on ProviderUser {
  static ProviderUser fromJson(final Map<String, dynamic> json) {
    return ProviderUser(
      userId: DtoValidation.dynamicToInt(json['userId']),
      rating: DtoValidation.dynamicToDouble(json['rating']),
      countryId: DtoValidation.dynamicToInt(json['countryId']),
      name: DtoValidation.dynamicToString(json['name']),
      photoUrl: DtoValidation.dynamicToString(json['photoUrl']),
      servicesDoneAmount:
          DtoValidation.dynamicToInt(json['servicesDoneAmount']),
      userSpecialty: DtoValidation.dynamicToListObject(
          json['userSpecialty'], ProviderUserSpecialityDto.fromJson),
    );
  }
}
