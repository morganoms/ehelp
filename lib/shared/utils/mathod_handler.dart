import 'package:multiple_result/multiple_result.dart';

import '../../core/default_exception.dart';
import '../../core/new_http/models/client_exception.dart';

// ignore: avoid_classes_with_only_static_members
class MethodHandler {
  static Future<Result<T, ClientException>> errorState<T>(
      final Future<T> Function() request) async {
    try {
      return Success(await request.call());
    } on ClientException catch (e) {
      return Error(e);
    } on Exception catch (_) {
      return Error(defaultException);
    }
  }
}
