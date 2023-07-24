import 'dart:typed_data';

enum ActionType {
  login,
  retry,
  leave;

  bool get isLogin => this == ActionType.login;
}

extension StringToActionType on String {
  ActionType convertToActionType() {
    switch (toUpperCase()) {
      case 'LOGIN':
        return ActionType.login;
      case 'RETRY':
        return ActionType.retry;
      default:
        return ActionType.leave;
    }
  }
}

abstract class HttpResponse {
  Uint8List get bodyBytes;

  String get body;

  bool get isSuccess;

  bool get isFailure;

  int get statusCode;

  int? get contentLength;

  String? get title => null;

  String? get message => null;

  ActionType? get actionType => null;

  String? get imagePath => null;

  String? get buttonFirst => null;
}
