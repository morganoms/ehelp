import 'package:ehelp/shared/entity/user/user.entity.dart';
import 'package:ehelp/shared/models/user_type.dart';

import '../../../core/dto_validations.dart';

extension UserDto on User {
  static User fromJson(final Map<String, dynamic>? json) {
    return User(
      cityId: DtoValidation.dynamicToInt(json?['cityId']),
      comunaId: DtoValidation.dynamicToInt(json?['comunaId']),
      countryId: DtoValidation.dynamicToInt(json?['countryId']),
      documentNumber: DtoValidation.dynamicToString(json?['documentNumber']),
      email: DtoValidation.dynamicToString(json?['email']),
      id: DtoValidation.dynamicToInt(json?['id']),
      languageId: DtoValidation.dynamicToInt(json?['languageId']),
      name: DtoValidation.dynamicToString(json?['name']),
      password: DtoValidation.dynamicToString(json?['password']),
      phone: DtoValidation.dynamicToString(json?['phone']),
      photoUrl: DtoValidation.dynamicToString(json?['photoUrl']),
      regionChId: DtoValidation.dynamicToInt(json?['regionChId']),
      regionId: DtoValidation.dynamicToInt(json?['regionId']),
      stateId: DtoValidation.dynamicToInt(json?['stateId']),
      statusId: DtoValidation.dynamicToInt(json?['statusId']),
      userTypeId:
          DtoValidation.dynamicToInt(json?['userTypeId']).convertToUserType(),
    );
  }
}
