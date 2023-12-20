class ServiceStatusWs {
  ServiceStatusWs({
    required this.statusId,
    required this.statusDescription,
    required this.description,
    required this.serviceId,
  });

  final int statusId;
  final String statusDescription;
  final String description;
  final int serviceId;

  ServiceStatusWs copyWith({
    int? statusId,
    String? statusDescription,
    String? description,
    int? serviceId,
  }) {
    return ServiceStatusWs(
      statusId: statusId ?? this.statusId,
      statusDescription: statusDescription ?? this.statusDescription,
      description: description ?? this.description,
      serviceId: serviceId ?? this.serviceId,
    );
  }
}

extension ServiceStatusWsDto on ServiceStatusWs {
  static ServiceStatusWs fromJson(final Map<String, dynamic> json) {
    return ServiceStatusWs(
      statusId: json['statusId'] as int,
      statusDescription: json['statusDescription'] as String,
      description: json['description'] as String,
      serviceId: json['serviceId'] as int,
    );
  }
}
