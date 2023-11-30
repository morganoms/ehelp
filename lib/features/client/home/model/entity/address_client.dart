import 'package:ehelp/core/dto_validations.dart';

enum Countries { chile, brasil }

class AdressClient {
  AdressClient(
      {this.id,
      required this.userId,
      required this.nickname,
      required this.zipcode,
      required this.street,
      required this.number,
      required this.countryId,
      required this.countryName,
      required this.stateId,
      required this.stateName,
      required this.cityId,
      required this.cityName,
      required this.comunaId,
      required this.comunaName,
      required this.regionId,
      required this.regionName,
      required this.additionalAddress,
      this.isChile});

  final int? id;
  final int userId;
  final String nickname;
  final String zipcode;
  final String street;
  final String number;
  final int countryId;
  final String countryName;
  final int stateId;
  final String stateName;
  final int cityId;
  final String cityName;
  final int comunaId;
  final String comunaName;
  final int regionId;
  final String regionName;
  final String additionalAddress;
  final bool? isChile;

  AdressClient copyWith({
    int? id,
    int? userId,
    String? nickname,
    String? zipcode,
    String? street,
    String? number,
    int? countryId,
    String? countryName,
    int? stateId,
    String? stateName,
    int? cityId,
    String? cityName,
    int? comunaId,
    String? comunaName,
    int? regionId,
    String? regionName,
    String? additionalAddress,
  }) {
    return AdressClient(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        nickname: nickname ?? this.nickname,
        zipcode: zipcode ?? this.zipcode,
        street: street ?? this.street,
        number: number ?? this.number,
        countryId: countryId ?? this.countryId,
        countryName: countryName ?? this.countryName,
        stateId: stateId ?? this.stateId,
        stateName: stateName ?? this.stateName,
        cityId: cityId ?? this.cityId,
        cityName: cityName ?? this.cityName,
        comunaId: comunaId ?? this.comunaId,
        comunaName: comunaName ?? this.comunaName,
        regionId: regionId ?? this.regionId,
        regionName: regionName ?? this.regionName,
        additionalAddress: additionalAddress ?? this.additionalAddress,
        isChile: isChile ?? this.isChile);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'nickname': nickname,
      'zipcode': zipcode,
      'street': street,
      'number': number,
      'countryId': countryId,
      'stateId': stateId,
      'cityId': cityId,
      'comunaId': comunaId,
      'regionId': regionId,
      'additionalAddress': additionalAddress,
      'isChile': isChile
    };
  }

  static Map<String, dynamic> toEmptyJson() {
    return <String, dynamic>{
      'id': null,
      'userId': null,
      'nickname': null,
      'zipcode': null,
      'street': null,
      'number': null,
      'countryId': null,
      'countryName': null,
      'stateId': null,
      'stateName': null,
      'cityId': null,
      'cityName': null,
      'comunaId': null,
      'comunaName': null,
      'regionId': null,
      'regionName': null,
      'additionalAddress': null,
      'isChile': null
    };
  }

  @override
  String toString() {
    return 'AdressClient(id: $id, userId: $userId, nickname: $nickname, zipcode: $zipcode, street: $street, number: $number, countryId: $countryId, countryName: $countryName, stateId: $stateId, stateName: $stateName, cityId: $cityId, cityName: $cityName, comunaId: $comunaId, comunaName: $comunaName, regionId: $regionId, regionName: $regionName, additionalAddress: $additionalAddress, isChile: $isChile)';
  }
}

extension AdressClientDto on AdressClient {
  static AdressClient fromJson(Map<String, dynamic> map) {
    return AdressClient(
      id: map['id'] != null ? DtoValidation.dynamicToInt(map['id']) : null,
      userId: DtoValidation.dynamicToInt(map['userId']),
      nickname: DtoValidation.dynamicToString(map['nickname']),
      zipcode: DtoValidation.dynamicToString(map['zipcode']),
      street: DtoValidation.dynamicToString(map['street']),
      number: DtoValidation.dynamicToString(map['number']),
      countryId: DtoValidation.dynamicToInt(map['countryId']),
      countryName: DtoValidation.dynamicToString(map['countryName']),
      cityName: DtoValidation.dynamicToString(map['cityName']),
      comunaName: DtoValidation.dynamicToString(map['comunaName']),
      stateName: DtoValidation.dynamicToString(map['stateName']),
      regionName: DtoValidation.dynamicToString(map['regionName']),
      additionalAddress:
          DtoValidation.dynamicToString(map['additionalAddress']),
      stateId: DtoValidation.dynamicToInt(map['stateId']),
      cityId: DtoValidation.dynamicToInt(map['cityId']),
      comunaId: DtoValidation.dynamicToInt(map['comunaId']),
      regionId: DtoValidation.dynamicToInt(map['regionId']),
    );
  }
}
