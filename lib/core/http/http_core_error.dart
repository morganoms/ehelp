import 'package:ehelp/core/http/http_response.dart';
import 'package:flutter/services.dart';

class HttpCoreError extends HttpResponse implements Exception {
  HttpCoreError({
    String? title,
    String? message,
    int? statusCode,
    Object? extraData,
    String? body,
    String? buttonFirst,
    int? errorCode,
  })  : _title = title,
        _message = message,
        _statusCode = statusCode,
        _extraData = extraData,
        _body = body,
        _buttonFirst = buttonFirst,
        _errorCode = errorCode,
        super();

  factory HttpCoreError.fromJson(Map<String, dynamic> json) => HttpCoreError(
        title: json['title'],
        message: json['message'],
        statusCode: json['code'],
        extraData: json['extraData'],
        body: json['body'],
        buttonFirst: json['buttonFirst'],
        errorCode: json['errorCode'],
      );

  factory HttpCoreError.fromResponse(HttpResponse response) => HttpCoreError(
        title: response.title,
        message: response.message,
        statusCode: response.statusCode,
        extraData: response.extraData,
        body: response.body,
        buttonFirst: response.buttonFirst,
      );

  final String? _body;
  final String? _title;
  final String? _message;
  final int? _statusCode;
  final Object? _extraData;
  final String? _buttonFirst;
  final int? _errorCode;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'message': message,
        'statusCode': statusCode,
        'extraData': extraData,
        'body': body,
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
  dynamic get extraData => _extraData;

  @override
  String? get message => _message;

  @override
  String? get buttonFirst => _buttonFirst;

  @override
  String? get title => _title;
}
