import '../../models/user_type.dart';

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.documentNumber,
    required this.stateId,
    required this.cityId,
    required this.regionId,
    required this.userTypeId,
    required this.password,
    required this.photoUrl,
    required this.statusId,
    required this.languageId,
    required this.countryId,
    required this.regionChId,
    required this.comunaId,
  });

  final int id;
  final String name;
  final String email;
  final String phone;
  final String documentNumber;
  final int stateId;
  final int cityId;
  final int regionId;
  final UserType userTypeId;
  final String password;
  final String photoUrl;
  final int statusId;
  final int languageId;
  final int countryId;
  final int regionChId;
  final int comunaId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'documentNumber': documentNumber,
        'stateId': stateId,
        'cityId': cityId,
        'regionId': regionId,
        'userTypeId': userTypeId.convertToint(),
        'password': password,
        'photoUrl': photoUrl,
        'statusId': statusId,
        'languageId': languageId,
        'countryId': countryId,
        'regionChId': regionChId,
        'comunaId': comunaId,
      };

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? documentNumber,
    int? stateId,
    int? cityId,
    int? regionId,
    UserType? userTypeId,
    String? password,
    String? photoUrl,
    int? statusId,
    int? languageId,
    int? countryId,
    int? regionChId,
    int? comunaId,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      documentNumber: documentNumber ?? this.documentNumber,
      stateId: stateId ?? this.stateId,
      cityId: cityId ?? this.cityId,
      regionId: regionId ?? this.regionId,
      userTypeId: userTypeId ?? this.userTypeId,
      password: password ?? this.password,
      photoUrl: photoUrl ?? this.photoUrl,
      statusId: statusId ?? this.statusId,
      languageId: languageId ?? this.languageId,
      countryId: countryId ?? this.countryId,
      regionChId: regionChId ?? this.regionChId,
      comunaId: comunaId ?? this.comunaId,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, documentNumber: $documentNumber, stateId: $stateId, cityId: $cityId, regionId: $regionId, userTypeId: $userTypeId, password: $password, photoUrl: $photoUrl, statusId: $statusId, languageId: $languageId, countryId: $countryId, regionChId: $regionChId, comunaId: $comunaId)';
  }
}
