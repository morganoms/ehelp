// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ehelp/shared/entity/professional_for_client.entity.dart';
import 'package:ehelp/shared/entity/speciality.entity.dart';
import 'package:flutter/foundation.dart';

class HomeClienty {
  final List<SpecialityEntity> specialities;
  final List<ProfessionalForClientEntity> lastestSearch;
  final List<ProfessionalForClientEntity> serviceHistory;
  final List<ProfessionalForClientEntity> bookedHistory;
  HomeClienty({
    required this.specialities,
    required this.lastestSearch,
    required this.serviceHistory,
    required this.bookedHistory,
  });

  HomeClienty copyWith({
    List<SpecialityEntity>? specialities,
    List<ProfessionalForClientEntity>? lastestSearch,
    List<ProfessionalForClientEntity>? serviceHistory,
    List<ProfessionalForClientEntity>? bookedHistory,
  }) {
    return HomeClienty(
      specialities: specialities ?? this.specialities,
      lastestSearch: lastestSearch ?? this.lastestSearch,
      serviceHistory: serviceHistory ?? this.serviceHistory,
      bookedHistory: bookedHistory ?? this.bookedHistory,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'specialities': specialities.map((x) => x.toMap()).toList(),
      'lastestSearch': lastestSearch.map((x) => x.toMap()).toList(),
      'serviceHistory': serviceHistory.map((x) => x.toMap()).toList(),
      'bookedHistory': bookedHistory.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeClienty.fromMap(Map<String, dynamic> map) {
    return HomeClienty(
      specialities: List<SpecialityEntity>.from(
        (map['specialities'] as List<int>).map<SpecialityEntity>(
          (x) => SpecialityEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
      lastestSearch: List<ProfessionalForClientEntity>.from(
        (map['lastestSearch'] as List<int>).map<ProfessionalForClientEntity>(
          (x) => ProfessionalForClientEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
      serviceHistory: List<ProfessionalForClientEntity>.from(
        (map['serviceHistory'] as List<int>).map<ProfessionalForClientEntity>(
          (x) => ProfessionalForClientEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
      bookedHistory: List<ProfessionalForClientEntity>.from(
        (map['bookedHistory'] as List<int>).map<ProfessionalForClientEntity>(
          (x) => ProfessionalForClientEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeClienty.fromJson(String source) =>
      HomeClienty.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomeClienty(specialities: $specialities, lastestSearch: $lastestSearch, serviceHistory: $serviceHistory, bookedHistory: $bookedHistory)';
  }

  @override
  bool operator ==(covariant HomeClienty other) {
    if (identical(this, other)) return true;

    return listEquals(other.specialities, specialities) &&
        listEquals(other.lastestSearch, lastestSearch) &&
        listEquals(other.serviceHistory, serviceHistory) &&
        listEquals(other.bookedHistory, bookedHistory);
  }

  @override
  int get hashCode {
    return specialities.hashCode ^
        lastestSearch.hashCode ^
        serviceHistory.hashCode ^
        bookedHistory.hashCode;
  }
}
