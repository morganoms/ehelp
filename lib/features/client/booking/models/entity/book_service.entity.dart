class BookService {
  BookService({
    required this.userContractorId,
    required this.userProviderId,
    required this.specialtyId,
    required this.statusId,
    this.description = '',
    required this.serviceDate,
    required this.serviceTime,
  });
  final int userContractorId;
  final int userProviderId;
  final int specialtyId;
  final int statusId;
  final String description;
  final String serviceDate;
  final int serviceTime;

  BookService copyWith({
    int? userContractorId,
    int? userProviderId,
    int? specialtyId,
    int? statusId,
    String? description,
    String? serviceDate,
    int? serviceTime,
  }) {
    return BookService(
      userContractorId: userContractorId ?? this.userContractorId,
      userProviderId: userProviderId ?? this.userProviderId,
      specialtyId: specialtyId ?? this.specialtyId,
      statusId: statusId ?? this.statusId,
      description: description ?? this.description,
      serviceDate: serviceDate ?? this.serviceDate,
      serviceTime: serviceTime ?? this.serviceTime,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userContractorId': userContractorId,
      'userProviderId': userProviderId,
      'specialtyId': specialtyId,
      'statusId': statusId,
      'description': description,
      'serviceDate': serviceDate,
      'serviceTime': serviceTime,
    };
  }

  @override
  String toString() {
    return 'BookService(userContractorId: $userContractorId, userProviderId: $userProviderId, specialtyId: $specialtyId, statusId: $statusId, description: $description, serviceDate: $serviceDate, serviceTime: $serviceTime)';
  }
}
