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
  final int userTypeId;
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
        'userTypeId': userTypeId,
        'password': password,
        'photoUrl': photoUrl,
        'statusId': statusId,
        'languageId': languageId,
        'countryId': countryId,
        'regionChId': regionChId,
        'comunaId': comunaId,
      };
}
