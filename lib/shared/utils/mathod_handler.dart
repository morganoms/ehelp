import 'package:multiple_result/multiple_result.dart';

import '../../core/default_exception.dart';
import '../../core/http/http_core_error.dart';
import '../../core/http/http_unauthorized_error.dart';

// ignore: avoid_classes_with_only_static_members
class MethodHandler {
  static Future<Result<T, HttpCoreError>> errorState<T>(
      final Future<T> Function() request) async {
    try {
      return Success(await request.call());
    } on HttpUnauthorizedError catch (_) {
      return Error(unauthorizedException);
    } on HttpCoreError catch (e) {
      return Error(e);
    } on Exception catch (_) {
      return Error(defaultException);
    }
  }
}
