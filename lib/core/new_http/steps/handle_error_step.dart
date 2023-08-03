import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';

import '../models/client_exception.dart';
import '../models/client_response.dart';

extension HandleErrorStep on ClientResponse {
  ClientException toClientException() {
    ClientErrorType errorType = ClientErrorType.unknown;
    if (statusCode == null) {
      errorType = ClientErrorType.unknown;
    }
    if (statusCode! >= 400 && statusCode! <= 499) {
      errorType = ClientErrorType.client;
    }
    if (statusCode! >= 500 && statusCode! <= 599) {
      errorType = ClientErrorType.server;
    }
    return ClientException(
      type: errorType,
      title: body?['title'],
      message: body?['message'],
      errorCode: body?['errorCode'],
      statusCode: statusCode,
      buttonFirst: body?['buttonFirst'],
      image: body?['extraData']?['image'],
      buttonAction: body?['extraData']?['buttonAction'],
    );
  }

  static ClientException handleObjectAsError(Object error) {
    switch (error.runtimeType) {
      case SocketException:
        debugPrint('[http-client] SocketException => $error');
        error as SocketException;
        throw ClientException(
          type: ClientErrorType.network,
          title: 'Network error',
          message: error.message,
        );
      case TimeoutException:
        debugPrint('[http-client] TimeoutException => $error');
        error as TimeoutException;
        throw ClientException(
          type: ClientErrorType.timeout,
          title: 'Timeout error',
          message: error.message,
        );
      case ClientResponse:
        debugPrint('[http-client] ClientException => $error');
        error as ClientResponse;
        throw error.toClientException();
      default:
        debugPrint('[http-client] Unexpected exception => $error');
        throw ClientException(
          message: error.runtimeType.toString(),
        );
    }
  }
}
