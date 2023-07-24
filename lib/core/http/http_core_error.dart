import 'package:ehelp/core/http/http_response.dart';
import 'package:flutter/services.dart';

class HttpCoreError extends HttpResponse implements Exception {
  HttpCoreError({
    String? title,
    String? message,
    int? statusCode,
    String? body,
    String? buttonFirst,
    String? imagePath,
    ActionType? actionType,
    int? errorCode,
  })  : _title = title,
        _message = message,
        _actionType = actionType,
        _statusCode = statusCode,
        _body = body,
        _imagePath = imagePath,
        _buttonFirst = buttonFirst,
        _errorCode = errorCode,
        super();

  factory HttpCoreError.fromJson(Map<String, dynamic> json) => HttpCoreError(
        title: json['title'],
        message: json['message'],
        statusCode: json['code'],
        actionType: json['actionType'],
        body: json['body'],
        imagePath: json['imagePath'],
        buttonFirst: json['buttonFirst'],
        errorCode: json['errorCode'],
      );

  factory HttpCoreError.fromResponse(HttpResponse response) => HttpCoreError(
        title: response.title,
        message: response.message,
        statusCode: response.statusCode,
        body: response.body,
        actionType: response.actionType,
        imagePath: response.imagePath,
        buttonFirst: response.buttonFirst,
      );

  final String? _body;
  final String? _title;
  final String? _message;
  final int? _statusCode;
  final String? _buttonFirst;
  final int? _errorCode;
  final String? _imagePath;
  final ActionType? _actionType;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'message': message,
        'statusCode': statusCode,
        'imagePath': imagePath,
        'body': body,
        'actionType': actionType,
        'buttonFirst': buttonFirst,
      };

  int? get errorCode => _errorCode;

  @override
  String get body => _body ?? '';

  @override
  Uint8List get bodyBytes => throw UnimplementedError();

  @override
  int? get contentLength => 0;

  @override
  bool get isFailure => true;

  @override
  bool get isSuccess => false;

  @override
  int get statusCode => _statusCode ?? 0;

  @override
  String? get imagePath => _imagePath;

  @override
  String? get message => _message;

  @override
  String? get buttonFirst => _buttonFirst;

  @override
  String? get title => _title;

  @override
  ActionType? get actionType => _actionType;
}
