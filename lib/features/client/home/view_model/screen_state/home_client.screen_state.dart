import 'package:ehelp/core/http/http_core_error.dart';

import '../../model/entity/home_client.entity.dart';

class HomeClientScreenStatus {
  HomeClientScreenStatus._();

  factory HomeClientScreenStatus.success(final HomeClientEntity data) = Success;
  factory HomeClientScreenStatus.error(final HttpCoreError requestError) =
      Error;
  factory HomeClientScreenStatus.loading() = Loading;
}

class Error extends HomeClientScreenStatus {
  Error(this.requestError) : super._();

  final HttpCoreError requestError;
}

class Success extends HomeClientScreenStatus {
  Success(this.data) : super._();

  final HomeClientEntity data;
}

class Loading extends HomeClientScreenStatus {
  Loading() : super._();
}
