import 'package:ehelp/core/dto_validations.dart';

class LocalityEntity {
  LocalityEntity({
    required this.id,
    required this.description,
  });
  final int id;
  final String description;

  LocalityEntity copyWith({
    int? id,
    String? description,
  }) {
    return LocalityEntity(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'description': description,
    };
  }

  @override
  String toString() => 'LocalityEntity(id: $id, description: $description)';
}

extension LocalityEntityDto on LocalityEntity {
  static LocalityEntity fromJson(final Map<String, dynamic> json) {
    return LocalityEntity(
      id: DtoValidation.dynamicToInt(json['id']),
      description: DtoValidation.dynamicToString(json['description']),
    );
  }
}
