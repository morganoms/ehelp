import '../../../../../../core/dto_validations.dart';

class BookedInfoEntity {
  BookedInfoEntity({required this.status, required this.solicitationDate});
  final String status;
  final DateTime solicitationDate;
}

extension BookedInfoDto on BookedInfoEntity {
  static BookedInfoEntity fromJson(final Map<String, dynamic> json) {
    return BookedInfoEntity(
      status: DtoValidation.dynamicToString(json['photoUstatusrl']),
      solicitationDate:
          DtoValidation.dynamicToDateTime(json['solicitationDate']),
    );
  }
}
