// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ehelp/shared/entity/booked_status.entity.dart';

import '../../core/dto_validations.dart';

class BookedInfo {
  final BookedStatus status;
  final DateTime solicitationDate;
  BookedInfo({
    required this.status,
    required this.solicitationDate,
  });

  BookedInfo copyWith({
    BookedStatus? status,
    DateTime? solicitationDate,
  }) {
    return BookedInfo(
      status: status ?? this.status,
      solicitationDate: solicitationDate ?? this.solicitationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status.label,
      'solicitationDate': solicitationDate.millisecondsSinceEpoch,
    };
  }

  factory BookedInfo.fromMap(Map<String, dynamic> map) {
    return BookedInfo(
      status:
          DtoValidation.dynamicToString(map['status']).convertToBookedStatus(),
      solicitationDate:
          DateTime.fromMillisecondsSinceEpoch(map['solicitationDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookedInfo.fromJson(String source) =>
      BookedInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BookedInfo(status: $status, solicitationDate: $solicitationDate)';

  @override
  bool operator ==(covariant BookedInfo other) {
    if (identical(this, other)) return true;

    return other.status == status && other.solicitationDate == solicitationDate;
  }

  @override
  int get hashCode => status.hashCode ^ solicitationDate.hashCode;
}
