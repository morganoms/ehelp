// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../core/dto_validations.dart';

class FeedbackEntity {
  FeedbackEntity({
    required this.id,
    required this.menssage,
  });
  final int id;
  final String menssage;

  FeedbackEntity copyWith({
    int? id,
    String? menssage,
  }) {
    return FeedbackEntity(
      id: id ?? this.id,
      menssage: menssage ?? this.menssage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'menssage': menssage,
    };
  }

  factory FeedbackEntity.fromMap(Map<String, dynamic> map) {
    return FeedbackEntity(
      id: DtoValidation.dynamicToInt(map['id']),
      menssage: DtoValidation.dynamicToString(map['menssage']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackEntity.fromJson(String source) =>
      FeedbackEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FeedbackEntity(id: $id, menssage: $menssage)';

  @override
  bool operator ==(covariant FeedbackEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.menssage == menssage;
  }

  @override
  int get hashCode => id.hashCode ^ menssage.hashCode;
}
