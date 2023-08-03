// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ehelp/core/dto_validations.dart';
import 'package:ehelp/features/client/home/model/entity/service_for_client.entity.dart';
import '../../../../../shared/entity/speciality.entity.dart';

class HomeClientEntity {
  final List<SpecialityEntity> specialities;
  final List<ServiceForClientEntity> lastestSearch;
  final List<ServiceForClientEntity> serviceHistory;
  final List<ServiceForClientEntity> bookedHistory;

  HomeClientEntity({
    required this.specialities,
    required this.lastestSearch,
    required this.serviceHistory,
    required this.bookedHistory,
  });
}

extension HomeClientDto on HomeClientEntity {
  static HomeClientEntity fromJson(final Map<String, dynamic>? json) {
    return HomeClientEntity(
      specialities: DtoValidation.dynamicToListObject(
          json?['specialities'], SpecialityDto.fromJson),
      lastestSearch: DtoValidation.dynamicToListObject(
          json?['latestSearch'], ServiceForClientDto.fromJson),
      serviceHistory: DtoValidation.dynamicToListObject(
          json?['serviceHistory'], ServiceForClientDto.fromJson),
      bookedHistory: DtoValidation.dynamicToListObject(
          json?['bookedHistory'], ServiceForClientDto.fromJson),
    );
  }
}
