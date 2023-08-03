import '../../../../../core/new_http/models/client_exception.dart';
import '../../model/entity/home_client.entity.dart';

class HomeClientScreenStatus {
  HomeClientScreenStatus._();

  factory HomeClientScreenStatus.success(final HomeClientEntity data) =
      ScreenSuccess;
  factory HomeClientScreenStatus.error(final ClientException requestError) =
      ScreenError;
  factory HomeClientScreenStatus.loading() = ScreenLoading;
}

class ScreenError extends HomeClientScreenStatus {
  ScreenError(this.requestError) : super._();

  final ClientException requestError;
}

class ScreenSuccess extends HomeClientScreenStatus {
  ScreenSuccess(this.data) : super._();

  final HomeClientEntity data;
}

class ScreenLoading extends HomeClientScreenStatus {
  ScreenLoading() : super._();
}
